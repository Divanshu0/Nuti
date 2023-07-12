import '../../../Response/Cat_response/cat_immuniti_response.dart';

abstract class ImmunitiCategoryState{
}

class ImmunitiInitial extends ImmunitiCategoryState {

}
class ImmunitiSuccess extends ImmunitiCategoryState {
  final ImmunitiResponse immunitiCategoryResponse ;
  ImmunitiSuccess(this.immunitiCategoryResponse);
}
class ImmunitiLoading extends ImmunitiCategoryState {
}

class ImmunitiError extends ImmunitiCategoryState {
  final String message;
  ImmunitiError(this.message);
}