import 'package:ecommerce/api/mapper/product_mapper.dart';
import 'package:ecommerce/api/model/response/wishlist/wishList_response_dto.dart';
import 'package:ecommerce/domain/entities/response/wishlist/wish_list_response.dart';

extension WishListResponseMapper on WishListResponseDto {
  WishListResponse toWishListResponse() {
    return WishListResponse(
      status: status,
      count: count,

      data: data?.map((productDto) => productDto.toProduct()).toList(),
    );
  }
}
