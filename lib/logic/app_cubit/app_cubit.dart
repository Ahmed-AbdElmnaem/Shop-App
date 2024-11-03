import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tahadoapp/core/services/api_service.dart';
import 'package:tahadoapp/core/services/endpoints.dart';
import 'package:tahadoapp/model/bannes_model';
import 'package:tahadoapp/model/catogry_model.dart';
import 'package:tahadoapp/model/prodcuts_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  CategoryModel? categoryModel;
  void getCategoryData() {
    emit(GetCategoryLoadingState());

    ApiService.getData(url: Endpoints.categories).then(
      (value) {
        categoryModel = CategoryModel.fromJson(value.data);
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

  BannersModel? bannersModel;

  void getBannersData() {
    emit(GetbannerslodingState());

    ApiService.getData(url: Endpoints.banners).then(
      (value) {
        bannersModel = BannersModel.fromJson(value.data);
        emit(GetbannersSuccessState(BannersModel.fromJson(value.data)));
      },
    ).catchError(
      (e) {
        log(e.toString());
        emit(
          GetbannersErrorState(e.toString()),
        );
      },
    );
  }

  ProductsModel? productModel;
  void getProductData() {
    emit(GetProductLoadingState());

    ApiService.getData(url: Endpoints.products).then(
      (value) {
        productModel = ProductsModel.fromJson(value.data);
        emit(GetProductSuccessState(ProductsModel.fromJson(value.data)));
      },
    ).catchError(
      (e) {
        log(e.toString());
        emit(
          GetProductErrorState(e.toString()),
        );
      },
    );
  }
}
