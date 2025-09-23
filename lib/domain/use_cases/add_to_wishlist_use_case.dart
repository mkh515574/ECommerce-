import 'package:ecommerce/domain/entities/response/add_cart_response.dart';
import 'package:ecommerce/domain/entities/response/add_wishlist.dart';
import 'package:ecommerce/domain/repositories/cart/cart_repository.dart';
import 'package:ecommerce/domain/repositories/favourites/favourites_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToWishlistUseCase{
  FavouritesRepository favouritesRepository ;
  AddToWishlistUseCase({required this.favouritesRepository});

  Future<AddWishList> invoke(String productId){
    return favouritesRepository.addWishList(productId);
  }
}