import 'package:ecommerce/domain/entities/response/add_wishlist.dart';
import 'package:ecommerce/domain/repositories/favourites/favourites_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteItemsInWishlistUseCase{
  FavouritesRepository cartRepository ;
  DeleteItemsInWishlistUseCase({required this.cartRepository});

  Future<AddWishList> invoke(String productId){
    return cartRepository.deleteItemsWishList(productId);
  }
}