import 'dart:developer';
import 'package:bloc/bloc.dart';
import '../../../repository/repo2.dart';
import 'cat_Nuti_state.dart';

class NutiCategoryCubit extends  Cubit<NutiCategoryState>{

  final Repository  _repository;
  NutiCategoryCubit(this._repository) : super(NutiInitial());

  Future<void> nutiScreen() async {
    try {
      emit(NutiLoading());
      log("messagecubit");
      final nutiCategoryResponse = await _repository.nutiCategoryrequest();
      emit(NutiSuccess(nutiCategoryResponse));

    }catch(e){
      emit(NutiError(e.toString()));
    }
  }
}
