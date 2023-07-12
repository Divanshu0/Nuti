import '../../../Response/signup_response.dart';

abstract class SignUpCubitStates  {}

class SignUpInitial extends SignUpCubitStates {

}

class SignUpSuccess extends SignUpCubitStates {
  final String message;
  SignUpSuccess(this.message);
}
class SignUpLoading extends SignUpCubitStates {

}

class SignUpError extends SignUpCubitStates {
  final String message;
  SignUpError(this.message);
}