import 'package:ecommerce/api/mapper/add_cart_mapper.dart';
import 'package:ecommerce/api/model/response/cart/add_cart/add_cart_response_dto.dart';
import 'package:ecommerce/domain/entities/response/add_cart_response.dart';

extension AddCartResponseMapper on AddCartResponseDto{
  AddCartResponse toAddCartResponse(){
    return AddCartResponse(
      status: status,
      numOfCartItems: numOfCartItems,
      data: data!.toAddCart(),
      cartId: cartId,
      message: message
    );
  }
}