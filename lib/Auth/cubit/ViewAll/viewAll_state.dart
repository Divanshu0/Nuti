import '../../../Response/viewAll_response.dart';

abstract class ViewAllState{
}

class ViewAllInitial extends ViewAllState {

}
class ViewAllSuccess extends ViewAllState {
  final ViewAll_response viewAll_response;
  ViewAllSuccess(this.viewAll_response);
}
class ViewAllLoading extends ViewAllState {
}

class ViewAllError extends ViewAllState {
  final String message;
  ViewAllError(this.message);
}