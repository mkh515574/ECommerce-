import 'package:ecommerce/domain/entities/request/product_request.dart';
import 'package:ecommerce/domain/entities/response/cart/cart_response.dart';

import '../entities/response/cart/add_to_cart.dart';

abstract class CartRepository {
  Future<CartResponse?> getCart(String token);
  Future<AddToCart?> addToCart(String token,ProductRequest productId);


}
