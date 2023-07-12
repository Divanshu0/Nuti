import '../../../Response/conf_email_response.dart';

abstract class ForgotPassword_Cubit_State {

}

class ForgotInitialState extends ForgotPassword_Cubit_State {}

class ForgotLoadingState extends ForgotPassword_Cubit_State {}

class ForgotSuccessState extends ForgotPassword_Cubit_State {
  final ConfirmationEmail forgetResponse;
  ForgotSuccessState(this.forgetResponse);
}

class ForgotError extends ForgotPassword_Cubit_State{
  final String message;
  ForgotError(this.message);
}