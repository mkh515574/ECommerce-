import 'package:ecommerce/domain/entities/response/cart/cart_response.dart';
import 'package:ecommerce/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartUseCase {
  CartRepository cartRepository;
  GetCartUseCase({required this.cartRepository});

  Future<CartResponse?> invoke(String token) {
    return cartRepository.getCart(token);
  }
}
