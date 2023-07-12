import 'package:bloc/bloc.dart';
import 'package:food_delivery/Auth/cubit/signup_cubit/signup_cubit_state.dart';
import '../../../repository/post_repo.dart';

class SignUpCubit extends Cubit<SignUpCubitStates> {

  final Post_Repo _repository;
  SignUpCubit(this._repository) : super(SignUpInitial());


  Future<void> register(String firstName, String lastName,int mobile,String email,String password,String confirmPassword,) async {
    try {
      emit(SignUpLoading());
      String message = await _repository.signUp(firstName , lastName ,mobile, email  , password , confirmPassword);
      emit(SignUpSuccess(message));

    }catch(e){
      emit(SignUpError(e.toString()));
    }
  }

}
