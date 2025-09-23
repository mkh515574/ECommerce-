import 'package:ecommerce/api/model/response/favourites/add_wishlist_dto.dart';
import 'package:ecommerce/domain/entities/response/add_wishlist.dart';

extension AddWishlistMapper on AddWishListDto{

  AddWishList toAddWishList(){
    return AddWishList(
      status: status,
      message: message,
      data: data
    );
  }
}