import 'package:ecommerce/domain/entities/response/add_cart_response.dart';
import 'package:ecommerce/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase{
  CartRepository cartRepository ;
  AddToCartUseCase({required this.cartRepository});

  Future<AddCartResponse> invoke(String productId){
    return cartRepository.addCart(productId);
  }
}