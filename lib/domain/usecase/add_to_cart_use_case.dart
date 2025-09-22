import 'package:ecommerce/domain/entities/response/cart/add_to_cart.dart';
import 'package:ecommerce/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/request/product_request.dart';

@injectable
class AddToCartUseCase {
  CartRepository cartRepository;
  AddToCartUseCase({required this.cartRepository});

  Future<AddToCart?> invoke(String token,ProductRequest productId) {
    return cartRepository.addToCart(token, productId);
  }
}
