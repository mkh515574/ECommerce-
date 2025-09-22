


import 'package:ecommerce/domain/entities/request/product_request.dart';

import '../../../domain/entities/response/cart/add_to_cart.dart';
import '../../../domain/entities/response/cart/cart_response.dart';

abstract class CartRemoteDataSource {
  Future<CartResponse?> getCart(String token);
  Future<AddToCart?> addToCart(String token,ProductRequest productId);


}
