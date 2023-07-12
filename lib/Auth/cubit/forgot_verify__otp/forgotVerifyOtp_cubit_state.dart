import '../../../Response/forgotVerifyOtp_response.dart';

abstract class ForgotOtpState{

}
class ForgotOtpInitial extends ForgotOtpState {

}

class ResendOtpSuccess extends ForgotOtpState {
  final String resendOtpResponse;
  ResendOtpSuccess(this.resendOtpResponse);
}

class ForgotOtpSuccess extends ForgotOtpState {
  final String forgotOtpResponse;
  ForgotOtpSuccess(this.forgotOtpResponse);
}
class ForgotOtpLoading extends ForgotOtpState {
}
class ForgotOtpError extends ForgotOtpState {
  final String message;
  ForgotOtpError(this.message);
}
//RESEND OTP




