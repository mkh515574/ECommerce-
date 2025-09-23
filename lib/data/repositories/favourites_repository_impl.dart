import 'package:ecommerce/domain/entities/response/add_wishlist.dart';
import 'package:ecommerce/domain/entities/response/favourites_response.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/favourites/favourites_repository.dart';
import '../data_sources/remote/favourites_remote_data_source.dart';

@Injectable(as: FavouritesRepository)
class FavouritesRepositoryImpl implements FavouritesRepository {
  FavouritesRemoteDataSource remoteDataSource;
  FavouritesRepositoryImpl({required this.remoteDataSource});
  @override
  Future<AddWishList> addWishList(String productId) {
    // TODO: implement addWishList
    return remoteDataSource.addWishList(productId);
  }

  @override
  Future<FavouritesResponse> getItemsWishList() {
    // TODO: implement getItemsWishList
    return remoteDataSource.getItemsWishList();
  }

  @override
  Future<AddWishList> deleteItemsWishList(String productId) {
    // TODO: implement deleteItemsWishList
    return remoteDataSource.deleteItemsWishList(productId);

  }
}
