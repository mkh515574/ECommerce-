import 'package:ecommerce/domain/entities/response/wishlist/add_to_wishlist.dart';
import 'package:ecommerce/domain/entities/response/wishlist/wish_list_response.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/request/product_request.dart';
import '../../domain/repository/wish_list_repository.dart';
import '../data_sources/remote/wish_list_remote_data_source.dart';

@Injectable(as: WishListRepository)
class WishListRepositoryImpl implements WishListRepository {
  WishListRemoteDataSource remoteDataSource;
  WishListRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AddToWishList?> addToWishList(String token, ProductRequest productId) {
    // TODO: implement addToWishList
    return remoteDataSource.addToWishList(token, productId);
  }

  @override
  Future<WishListResponse?> getAllWishList(String token) {
    // TODO: implement getAllWishList

    return remoteDataSource.getAllWishList(token);
  }

  @override
  Future<AddToWishList?> removeItemWishList(String token, ProductRequest productId) {
    // TODO: implement removeItemWishList
    return remoteDataSource.removeItemWishList(token, productId);
  }
}
