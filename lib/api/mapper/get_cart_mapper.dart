import 'package:ecommerce/api/mapper/get_products_mapper.dart';
import 'package:ecommerce/api/model/response/cart/get_cart/get_cart_dto.dart';
import 'package:ecommerce/domain/entities/response/get_cart.dart';

extension GetCartMapper on GetCartDto{
  GetCart toGetCart(){
    return GetCart(
      id: id,
      cartOwner: cartOwner,
      totalCartPrice: totalCartPrice,
      v: v,
      products: products?.map((getProductDto)=>getProductDto.toGetProducts()).toList()??[]
    );
  }
}