import '../../../../Response/best_selling_product/product1_response.dart';

abstract class Product1State {}

class Product1Initial extends Product1State {

}

class Product1Success extends Product1State {
  final Product1_Response product1Response;
  Product1Success(this.product1Response);
}

class Product1Loading extends Product1State {
}

class Product1Error extends Product1State {
  final String message;
  Product1Error(this.message);
}