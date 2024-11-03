import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tahadoapp/core/services/api_service.dart';
import 'package:tahadoapp/core/services/endpoints.dart';
import 'package:tahadoapp/logic/register_cubit/register_state.dart';
import 'package:tahadoapp/model/register_model.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  RegisterModel? registerModel;
  userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String image,
  }) {
    emit(RegisterLoadingState());

    ApiService.postData(
      endpoint: Endpoints.register,
      body: {
        "email": email,
        "password": password,
        "name": name,
        "phone": phone,
        "image": image,
      },
    ).then(
      (value) {
        registerModel = RegisterModel.fromJson(value.data);
        log(registerModel!.message.toString());
        emit(RegisterSuccessState());
      },
    ).catchError((e) {
      log(e.toString());
      emit(RegisterErrorState(errMessage: e.toString()));
    });
  }
}
