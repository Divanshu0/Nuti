import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:food_delivery/repository/repo2.dart';

 import 'mainfoodpage_state.dart';

class MainFoodPageCubit extends  Cubit<MainFoodPageState>{

  final Repository  _repository;
  MainFoodPageCubit(this._repository) : super(MainInitial());

  Future<void> mainScreen() async {
    try {
      emit(MainLoading());
      log("messagecubit");
      final mainResponse = await _repository.checkapi();
      emit(MainSuccess(mainResponse));

    }catch(e){
      emit(MainError(e.toString()));
    }
  }
}
