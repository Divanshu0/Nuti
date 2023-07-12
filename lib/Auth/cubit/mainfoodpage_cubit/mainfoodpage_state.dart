import '../../../Response/mainfoodpage_response.dart';

abstract class MainFoodPageState{
}

class MainInitial extends MainFoodPageState {

}
class MainSuccess extends MainFoodPageState {
  final MainFoodPageResponse mainfoodpageResponse ;
  MainSuccess(this.mainfoodpageResponse);
}
class MainLoading extends MainFoodPageState {
}

class MainError extends MainFoodPageState {
  final String message;
  MainError(this.message);
}