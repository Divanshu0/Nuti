class ForgotOtpCubit {
  ForgotOtpCubit({
    required this.status,
    required this.message,
  });
  late final int status;
  late final String message;

  ForgotOtpCubit.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    return _data;
  }
}
class ResendOtpResponse {
  ResendOtpResponse({
    required this.message,
  });
  late final String message;

  ResendOtpResponse.fromJson(Map<String, dynamic> json){
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    return _data;
  }
}