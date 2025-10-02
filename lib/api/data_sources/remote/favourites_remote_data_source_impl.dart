import 'package:dio/dio.dart';
import 'package:ecommerce/api/mapper/add_wishlist_mapper.dart';
import 'package:ecommerce/api/mapper/favourites_response_mapper.dart';
import 'package:ecommerce/api/mapper/get_cart_response_mapper.dart';
import 'package:ecommerce/api/model/request/add_product_request_dto.dart';
import 'package:ecommerce/api/model/request/count_request_dto.dart';
import 'package:ecommerce/api/web_services.dart';
import 'package:ecommerce/core/cache/shared_prefs_utils.dart';
import 'package:ecommerce/domain/entities/response/add_wishlist.dart';
import 'package:ecommerce/domain/entities/response/favourites_response.dart';
import 'package:ecommerce/domain/entities/response/get_cart_response.dart';
import 'package:injectable/injectable.dart';

import '../../../core/exceptions/app_exception.dart';
import '../../../data/data_sources/remote/favourites_remote_data_source.dart';

@Injectable(as: FavouritesRemoteDataSource)
class CartRemoteDataSourceImpl implements FavouritesRemoteDataSource{
  WebServices webServices ;
  CartRemoteDataSourceImpl({required this.webServices});

  @override
  Future<AddWishList> deleteItemsWishList(String productId) async{
    try{
      String? token = SharedPrefsUtils.getData(key: 'token') as String?;
      var deleteWishListResponse = await webServices.deleteItemsInWishList(productId,token ?? '');
      //todo: getCartResponseDto => getCartResponse
      return deleteWishListResponse.toAddWishList();
    }on DioException catch(e){
      String message = (e.error as AppException).message ;
      throw ServerException(message: message);
    }
  }

  @override
  Future<GetCartResponse> updateCountsCart(String productId, int count)async {
    try{
      String? token = SharedPrefsUtils.getData(key: 'token') as String?;
      CountRequestDto countRequest = CountRequestDto(
        count: '$count'
      );
      var updateCartResponse = await webServices.updateCountsInCart(productId,token ?? '',
        countRequest
      );
      //todo: getCartResponseDto => getCartResponse
      return updateCartResponse.toGetCartResponse();
    }on DioException catch(e){
      String message = (e.error as AppException).message ;
      throw ServerException(message: message);
    }
  }

  @override
  Future<AddWishList> addWishList(String productId) async{
    // TODO: implement addWishList
    try{
      AddProductRequestDto productRequest = AddProductRequestDto(
          productId: productId
      );
      String? token = SharedPrefsUtils.getData(key: 'token') as String?;
      var addWishList = await webServices.addToWishList(productRequest, token ??'');
      //todo: addWishListDto => addWishList
      return addWishList.toAddWishList();
    }on DioException catch(e){
      String message = (e.error as AppException).message ;
      throw ServerException(message: message);
    }

  }

  @override
  Future<FavouritesResponse> getItemsWishList() async{
    // TODO: implement getItemsWishList
    try{
      String? token = SharedPrefsUtils.getData(key: 'token') as String?;
      var getWithList = await webServices.getItemsWishList(token ?? '');
      //todo: getCartResponseDto => getCartResponse
      return getWithList.toFavouritesResponse();
    }on DioException catch(e){
      String message = (e.error as AppException).message ;
      throw ServerException(message: message);
    }
  }

}