import 'package:ecommerce/domain/entities/response/wishlist/add_to_wishlist.dart';
import 'package:ecommerce/domain/entities/response/wishlist/wish_list_response.dart';
import 'package:ecommerce/domain/repository/wish_list_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/request/product_request.dart';

@injectable
class GetAllWishListUseCase {
  WishListRepository wishListRepository;
  GetAllWishListUseCase({required this.wishListRepository});

  Future<WishListResponse?> invoke(String token) {
    return wishListRepository.getAllWishList(token);
  }
}
