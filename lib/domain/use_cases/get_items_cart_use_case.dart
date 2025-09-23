import 'package:ecommerce/domain/entities/response/get_cart_response.dart';
import 'package:injectable/injectable.dart';

import '../repositories/cart/cart_repository.dart';

@injectable
class GetItemsCartUseCase{
  CartRepository cartRepository ;
  GetItemsCartUseCase({required this.cartRepository});

  Future<GetCartResponse> invoke(){
    return cartRepository.getItemsCart();
  }
}