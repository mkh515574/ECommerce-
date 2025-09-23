import 'package:ecommerce/domain/entities/response/favourites_response.dart';
import 'package:ecommerce/domain/repositories/favourites/favourites_repository.dart';
import 'package:injectable/injectable.dart';


@injectable
class GetItemsWishlistUseCase{
  FavouritesRepository favouritesRepository ;
  GetItemsWishlistUseCase({required this.favouritesRepository});

  Future<FavouritesResponse> invoke(){
    return favouritesRepository.getItemsWishList();
  }
}