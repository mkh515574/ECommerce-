import 'package:ecommerce/api/mapper/get_cart_mapper.dart';
import 'package:ecommerce/api/model/response/cart/get_cart/get_cart_response_dto.dart';
import 'package:ecommerce/domain/entities/response/get_cart_response.dart';

extension GetCartResponseMapper on GetCartResponseDto{
  GetCartResponse toGetCartResponse(){
    return GetCartResponse(
      cartId: cartId,
      data: data!.toGetCart(),
      numOfCartItems: numOfCartItems,
      status: status
    );
  }
}