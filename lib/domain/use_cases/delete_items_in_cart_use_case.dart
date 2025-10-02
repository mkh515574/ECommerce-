import 'package:ecommerce/domain/entities/response/get_cart_response.dart';
import 'package:ecommerce/domain/repositories/cart/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteItemsInCartUseCase{
  CartRepository cartRepository ;
  DeleteItemsInCartUseCase({required this.cartRepository});

  Future<GetCartResponse> invoke(String productId){
    return cartRepository.deleteItemsCart(productId);
  }
}