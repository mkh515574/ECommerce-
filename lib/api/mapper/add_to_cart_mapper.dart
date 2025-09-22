import 'package:ecommerce/api/mapper/data_mapper.dart';
import 'package:ecommerce/api/model/response/cart/add_to_cart_dto.dart';
import 'package:ecommerce/domain/entities/response/cart/add_to_cart.dart';

extension AddToCartMapper on AddToCartDto{

  AddToCart toAddToCart(){
    return AddToCart(
      status: status,
      message: message,
      numOfCartItems: numOfCartItems,
      cartId: cartId,
      data: data?.toData(),
    );
  }
}