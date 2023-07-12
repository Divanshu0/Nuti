import 'package:bloc/bloc.dart';
import 'package:food_delivery/Auth/cubit/Best_Selling_Products/products1_cubit/products1_state.dart';
import '../../../../Response/best_selling_product/product1_response.dart';
import '../../../../repository/post_repo.dart';

class Product1Cubit extends Cubit<Product1State>{
  final Post_Repo _repository;
  Product1Cubit(this._repository) : super(Product1Initial());


  Future<void> products1(String product_id) async {
    try {
      emit(Product1Loading());
      Product1_Response product1_Response = await _repository.products1(product_id);
      emit(Product1Success(product1_Response));

    }catch(e){
      emit(Product1Error(e.toString()));
    }
  }
}