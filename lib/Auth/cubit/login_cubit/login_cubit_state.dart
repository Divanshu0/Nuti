import '../../../Response/login_response.dart';

abstract class LoginCubitState{
}

class LoginInitial extends LoginCubitState {

}
class LoginSuccess extends LoginCubitState {
  final LoginResponse loginResponse ;
  LoginSuccess(this.loginResponse);
}
class LoginLoading extends LoginCubitState {
}

class LoginError extends LoginCubitState {
  final String message;
  LoginError(this.message);
}