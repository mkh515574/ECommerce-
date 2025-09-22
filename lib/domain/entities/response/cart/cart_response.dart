
import 'package:ecommerce/domain/entities/response/cart/data.dart';

class CartResponse {
  final String? status;
  final int? numOfCartItems;
  final String? cartId;
  final Data? data;

  CartResponse ({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });


}

