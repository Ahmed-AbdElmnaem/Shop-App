abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errMessage;

  LoginErrorState({required this.errMessage});
}

class LoginSuccessState extends LoginState {}
