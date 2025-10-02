import 'package:ecommerce/api/mapper/product_mapper.dart';
import 'package:ecommerce/api/model/response/favourites/favourites_response_dto.dart';
import 'package:ecommerce/domain/entities/response/favourites_response.dart';

extension FavouritesResponseMapper on FavouritesResponseDto{

  FavouritesResponse toFavouritesResponse(){
    return FavouritesResponse(
      status: status,
      count: count,
      data: data?.map((dataDto)=> dataDto.toProduct()).toList()
    );
  }
}
