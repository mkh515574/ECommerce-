
import 'package:ecommerce/domain/entities/response/wishlist/add_to_wishlist.dart';

import '../../../domain/entities/request/product_request.dart';
import '../../../domain/entities/response/wishlist/wish_list_response.dart';

abstract class WishListRemoteDataSource {
  Future<AddToWishList?> addToWishList(String token,ProductRequest productId);
  Future<AddToWishList?> removeItemWishList(String token,ProductRequest productId);
  Future<WishListResponse?> getAllWishList(String token);



}
