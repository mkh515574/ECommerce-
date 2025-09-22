import 'package:ecommerce/api/mapper/add_to_cart_mapper.dart';
import 'package:ecommerce/api/mapper/add_to_wish_list_mapper.dart';
import 'package:ecommerce/api/mapper/cart_response_mapper.dart';
import 'package:ecommerce/api/mapper/product_request_mapper.dart';
import 'package:ecommerce/api/mapper/wish_list_response_mapper.dart';
import 'package:ecommerce/api/model/request/product_request_dto.dart';
import 'package:ecommerce/domain/entities/request/product_request.dart';
import 'package:ecommerce/domain/entities/response/cart/add_to_cart.dart';
import 'package:ecommerce/domain/entities/response/cart/cart_response.dart';
import 'package:ecommerce/domain/entities/response/wishlist/add_to_wishlist.dart';
import 'package:ecommerce/domain/entities/response/wishlist/wish_list_response.dart';
import 'package:injectable/injectable.dart';

import '../../../data/data_sources/remote/cart_remote_data_source.dart';
import '../../../data/data_sources/remote/wish_list_remote_data_source.dart';
import '../../web_services.dart';

@Injectable(as: WishListRemoteDataSource)
class WishListRemoteDataSourceImpl implements WishListRemoteDataSource {
  WebServices webServices;
  WishListRemoteDataSourceImpl({required this.webServices});

  @override
  Future<AddToWishList?> addToWishList(
    String token,
    ProductRequest productId,
  ) async {
    // TODO: implement addToWishList

    var response = await webServices.addToWishList(
      token,
      productId.toProductRequest(),
    );

    return response.toAddToWishList();
  }

  @override
  Future<WishListResponse?> getAllWishList(String token) async {
    // TODO: implement getAllWishList

    var response = await webServices.getAllWishList(token);
    return response.toWishListResponse();
  }

  @override
  Future<AddToWishList?> removeItemWishList(
    String token,
    ProductRequest productId,
  ) async {
    // TODO: implement removeItemWishList
    ProductRequestDto productRequestDto = productId.toProductRequest();
    var response = await webServices.deleteItemWishList(
      productRequestDto.productId!,
      token,
    );

    return response.toAddToWishList();
  }
}
