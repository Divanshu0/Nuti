import 'package:bloc/bloc.dart';

import '../../../Response/login_response.dart';
import '../../../repository/post_repo.dart';
import 'login_cubit_state.dart';

class LoginCubit extends  Cubit<LoginCubitState>{

  final Post_Repo  _repository;
  LoginCubit(this._repository) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    try {

      emit(LoginLoading());
      LoginResponse loginResponse = await _repository.login(email,password);
      emit(LoginSuccess(loginResponse));
      print(loginResponse);

    }catch(e){
      emit(LoginError(e.toString()));
    }
  }
}

