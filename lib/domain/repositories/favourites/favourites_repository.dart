import 'package:ecommerce/domain/entities/response/add_wishlist.dart';
import 'package:ecommerce/domain/entities/response/favourites_response.dart';

abstract class FavouritesRepository{
  Future<AddWishList> addWishList(String productId);
  Future<FavouritesResponse> getItemsWishList();
  Future<AddWishList> deleteItemsWishList(String productId);
  // Future<GetCartResponse> updateCountsCart(String productId, int count);
}