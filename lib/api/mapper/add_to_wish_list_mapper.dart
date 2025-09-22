import 'package:ecommerce/api/mapper/data_mapper.dart';
import 'package:ecommerce/api/model/response/cart/add_to_cart_dto.dart';
import 'package:ecommerce/api/model/response/wishlist/add_to_wishlist_dto.dart';
import 'package:ecommerce/domain/entities/response/cart/add_to_cart.dart';
import 'package:ecommerce/domain/entities/response/wishlist/add_to_wishlist.dart';

extension AddToWishListMapper on AddToWishListDto{

  AddToWishList toAddToWishList(){
    return AddToWishList(
      status: status,
      message: message,

      data: data,
    );
  }
}