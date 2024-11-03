class RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String errMessage;

  RegisterErrorState({required this.errMessage});
}

class RegisterSuccessState extends RegisterState {}
