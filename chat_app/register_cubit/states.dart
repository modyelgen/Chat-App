abstract class RegisterStates {}

class InitialRegisterState extends RegisterStates {}

class LoadingRegisterState extends RegisterStates {}

class SuccessRegisterState extends RegisterStates {}

class FailedRegisterState extends RegisterStates {
  String errMessage;
  FailedRegisterState({required this.errMessage});
}
