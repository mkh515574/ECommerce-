import 'package:dio/dio.dart';
import 'package:ecommerce/api/model/request/login_request_dto.dart';
import 'package:ecommerce/api/model/response/auth_response_dto.dart';
import 'package:ecommerce/api/model/response/cart/add_to_cart_dto.dart';
import 'package:ecommerce/api/model/response/products/products_response_dto.dart';
import 'package:ecommerce/api/model/response/wishlist/wishList_response_dto.dart';
import 'package:retrofit/retrofit.dart';

import 'api_end_points.dart';
import 'model/request/product_request_dto.dart';
import 'model/request/register_request_dto.dart';
import 'model/response/cart/cart_response_dto.dart';
import 'model/response/category/category_response_dto.dart';
import 'model/response/wishlist/add_to_wishlist_dto.dart';

part 'web_services.g.dart';

@RestApi()
abstract class WebServices {
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @POST(ApiEndPoints.loginApiUrl)
  Future<AuthResponseDto> login(@Body() LoginRequestDto loginRequest);
  @POST(ApiEndPoints.loginApiUrl)
  Future<AuthResponseDto> register(@Body() RegisterRequestDto registerRequest);
  @GET(ApiEndPoints.categoryApiUrl)
  Future<CategoryResponseDto> getAllCategory();

  @GET(ApiEndPoints.brandsApiUrl)
  Future<CategoryResponseDto> getAllBrands(@Query("limit") int limit);
  @GET(ApiEndPoints.productsApiUrl)
  Future<ProductsResponseDto> getAllProducts();
  @GET(ApiEndPoints.cartApiUrl)
  Future<CartResponseDto> getCart(@Header("token") String token);
  @POST(ApiEndPoints.cartApiUrl)
  Future<AddToCartDto> addToCart(
      @Header("token") String token,
      @Body() ProductRequestDto productId,
      );

  @POST(ApiEndPoints.wishListApiUrl)
  Future<AddToWishListDto> addToWishList(
      @Header("token") String token,
      @Body() ProductRequestDto productId,
      );
  @GET(ApiEndPoints.wishListApiUrl)
  Future<WishListResponseDto> getAllWishList(
      @Header("token") String token,
      );

  @DELETE("${ApiEndPoints.wishListApiUrl}/{id}")
  Future<AddToWishListDto> deleteItemWishList(
      @Path("id") String productId,
      @Header("token") String token,
      );

}
