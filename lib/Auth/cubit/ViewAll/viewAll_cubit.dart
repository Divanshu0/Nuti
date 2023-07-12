import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:food_delivery/Auth/cubit/ViewAll/viewAll_state.dart';
import '../../../repository/repo2.dart';

class ViewAllCubit extends  Cubit<ViewAllState>{

  final Repository  _repository;
  ViewAllCubit(this._repository) : super(ViewAllInitial());

  Future<void> viewAllScreen() async {
    try {
      emit(ViewAllLoading());
      log("message cubit");
      final viewAllResponse = await _repository.ViewAllrequest();
      emit(ViewAllSuccess(viewAllResponse));

    }catch(e){
      emit(ViewAllError(e.toString()));
    }
  }
}