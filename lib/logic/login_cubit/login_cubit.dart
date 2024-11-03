import 'dart:developer';

import 'package:tahadoapp/core/services/api_service.dart';
import 'package:tahadoapp/core/services/endpoints.dart';
import 'package:tahadoapp/logic/login_cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tahadoapp/model/login_model.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  //static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

    ApiService.postData(
      endpoint: Endpoints.login,
      body: {
        "email": email,
        "password": password,
      },
    ).then(
      (value) {
        loginModel = LoginModel.fromJson(value.data);
        log(loginModel!.message.toString());
        emit(LoginSuccessState());
      },
    ).catchError((e) {
      log(e.toString());
      emit(LoginErrorState(errMessage: e.toString()));
    });
  }
}
