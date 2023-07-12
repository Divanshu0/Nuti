import 'dart:developer';
import 'package:bloc/bloc.dart';
import '../../../repository/repo2.dart';
import 'cat_Immuniti_state.dart';

class ImmuntiCategoryCubit extends  Cubit<ImmunitiCategoryState>{

  final Repository  _repository;
  ImmuntiCategoryCubit(this._repository) : super(ImmunitiInitial());

  Future<void> immuntiScreen() async {
    try {
      emit(ImmunitiLoading());
      log("messagecubit");
      final immunitiResponse = await _repository.immunitiCategoryrequest();
      emit(ImmunitiSuccess(immunitiResponse));

    }catch(e){
      emit(ImmunitiError(e.toString()));
    }
  }
}
