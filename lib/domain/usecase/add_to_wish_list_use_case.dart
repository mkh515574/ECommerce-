import 'package:ecommerce/domain/entities/response/wishlist/add_to_wishlist.dart';
import 'package:ecommerce/domain/repository/wish_list_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/request/product_request.dart';

@injectable
class AddToWishListUseCase {
  WishListRepository wishListRepository;
  AddToWishListUseCase({required this.wishListRepository});

  Future<AddToWishList?> invoke(String token, ProductRequest productId) {
    return wishListRepository.addToWishList(token, productId);
  }
}
