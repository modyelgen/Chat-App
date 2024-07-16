abstract class LoginStates {}

class InitialLoginState extends LoginStates{}

class LoadingLoginState extends LoginStates{}

class SuccessLoginState extends LoginStates{}

class FailedLoginState extends LoginStates{
  String errMessage;
  FailedLoginState({required this.errMessage});
}
