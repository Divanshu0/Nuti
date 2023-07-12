import 'package:bloc/bloc.dart';

import '../../../Response/conf_email_response.dart';
import '../../../repository/post_repo.dart';
import 'conf_email_state.dart';

class ForgetPasswordCubits extends Cubit<ForgotPassword_Cubit_State> {

  final Post_Repo  _repository;
  ForgetPasswordCubits(this._repository) : super(ForgotInitialState());

  Future<void> forgetPassword(String email) async {
    try {

      emit(ForgotLoadingState());

      ConfirmationEmail forgetResponse = await _repository.getForgetPassword(email);

      emit(ForgotSuccessState(forgetResponse));

    }catch(e){

      emit(ForgotError(e.toString()));
    }
  }

}