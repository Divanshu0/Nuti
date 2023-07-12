import '../../../Response/Cat_response/cat_nuti_response.dart';

abstract class NutiCategoryState{
}

class NutiInitial extends NutiCategoryState {

}
class NutiSuccess extends NutiCategoryState {
  final NutiCategoryResponse nutiCategoryResponse ;
  NutiSuccess(this.nutiCategoryResponse);
}
class NutiLoading extends NutiCategoryState {
}

class NutiError extends NutiCategoryState {
  final String message;
  NutiError(this.message);
}