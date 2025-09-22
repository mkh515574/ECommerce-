
 import 'package:ecommerce/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:ecommerce/domain/entities/request/product_request.dart';
import 'package:ecommerce/domain/entities/response/cart/add_to_cart.dart';
import 'package:ecommerce/domain/entities/response/cart/cart_response.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/cart_repository.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository{
  CartRemoteDataSource remoteDataSource;
  CartRepositoryImpl({required this.remoteDataSource});


  @override
  Future<CartResponse?> getCart(String token) {
    // TODO: implement getCart
    return remoteDataSource.getCart(token);
  }

  @override
  Future<AddToCart?> addToCart(String token, ProductRequest productId) {
    // TODO: implement addToCart
    return remoteDataSource.addToCart(token, productId);
  }

}