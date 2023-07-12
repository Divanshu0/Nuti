import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:food_delivery/Auth/cubit/verificationOtp/verificationOtp_Cubit_State.dart';
import '../../../Response/verificationOtp_response.dart';
import '../../../repository/post_repo.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState>{
  final Post_Repo _repository;
  VerifyOtpCubit(this._repository) : super(VerifyOtpInitial());


  Future<void> verifyOtp(String email, int Otp) async {
    log("message$Otp$email");
    try {
      emit(VerifyOtpLoading());
      VerifyOtpResponse verifyOtpResponse = (await _repository.verifyOtp(email, Otp));
      emit(VerifyOtpSuccess(verifyOtpResponse));

    }catch(e){
      emit(VerifyOtpError(e.toString()));
    }
  }
}
