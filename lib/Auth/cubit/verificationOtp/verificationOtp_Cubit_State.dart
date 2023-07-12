import '../../../Response/verificationOtp_response.dart';

abstract class VerifyOtpState {}

class VerifyOtpInitial extends VerifyOtpState {

}

class VerifyOtpSuccess extends VerifyOtpState {
  final VerifyOtpResponse verifyOtpResponse;
  VerifyOtpSuccess(this.verifyOtpResponse);
}

class VerifyOtpLoading extends VerifyOtpState {
}

class VerifyOtpError extends VerifyOtpState {
  final String message;
  VerifyOtpError(this.message);
}
