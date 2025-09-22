import 'package:ecommerce/api/mapper/data_mapper.dart';
import 'package:ecommerce/api/model/response/cart/cart_response_dto.dart';
import 'package:ecommerce/domain/entities/response/cart/cart_response.dart';

extension CartResponseMapper on CartResponseDto{

  CartResponse toCartResponse(){
    return CartResponse(
      status: status,
      numOfCartItems: numOfCartItems,
      cartId: cartId,
      data: data?.toData()
    );
  }

}