import 'package:ecommerce/domain/entities/response/cart/add_to_cart.dart';
import 'package:ecommerce/domain/entities/response/cart/cart_response.dart';

sealed class CartStates{}


class CartInitialState extends CartStates{}
class CartLoadingState extends CartStates{}
class CartSuccessState extends CartStates{
  final int num;
  final CartResponse? cartResponse;
  CartSuccessState(this.num,this.cartResponse);
}
class CartErrorState extends CartStates{
  final String message;
  CartErrorState(this.message);


}
class AddToCartSuccessState extends CartStates{

  final AddToCart? cartResponse;
  AddToCartSuccessState(this.cartResponse);
}
class AddToCartErrorState extends CartStates{
  final String message;
  AddToCartErrorState(this.message);


}