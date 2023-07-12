
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:food_delivery/repository/post_repo.dart';
  import 'forgotVerifyOtp_cubit_state.dart';

class ForgotOtpCubit extends Cubit<ForgotOtpState>{
  final Post_Repo _repository;
  ForgotOtpCubit(this._repository) : super(ForgotOtpInitial());

  Future<void> forgotOtp(String email, int Otp) async{
    log("sdsd$Otp$email");
    try {
      emit(ForgotOtpLoading());
      final forgotOtpResponse = (await _repository.forgotOtp(email, Otp));
      emit(ForgotOtpSuccess(forgotOtpResponse));

    }catch(e){
      emit(ForgotOtpError(e.toString()));

    }
  }


  Future<void> resendOtp(String email) async {
    log(email);
    try {
      emit(ForgotOtpLoading());

      final resendOtp = await _repository.resendOtp(email);

      emit(ResendOtpSuccess(resendOtp));

    } catch (e) {
      emit(ForgotOtpError(e.toString()));
    }
  }


}