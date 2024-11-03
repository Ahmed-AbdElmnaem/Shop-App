import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tahadoapp/core/services/api_service.dart';
import 'package:tahadoapp/core/services/endpoints.dart';
import 'package:tahadoapp/model/catogry_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());


  void getCategoryData() {
    emit(GetCategoryLoadingState());

    ApiService.getData(url: Endpoints.categories).then(
      (value) {
        emit(GetCategorySuccessState(CategoryModel.fromJson(value.data)));
      },
    ).catchError(
      (e) {
        emit(
          GetCategoryErrorState(e.toString()),
        );
      },
    );
  }
}
