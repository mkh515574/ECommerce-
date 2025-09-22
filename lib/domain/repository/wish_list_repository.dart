import 'package:ecommerce/domain/entities/request/product_request.dart';
import 'package:ecommerce/domain/entities/response/wishlist/add_to_wishlist.dart';
import 'package:ecommerce/domain/entities/response/wishlist/wish_list_response.dart';


abstract class WishListRepository {
  Future<AddToWishList?> addToWishList(String token,ProductRequest productId);
  Future<AddToWishList?> removeItemWishList(String token,ProductRequest productId);
  Future<WishListResponse?> getAllWishList(String token);



}
