import 'package:ecommerce/api/model/response/common/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favourites_response_dto.g.dart';

@JsonSerializable()
class FavouritesResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "data")
  final List<ProductDto>? data;

  FavouritesResponseDto ({
    this.status,
    this.count,
    this.data,
  });

  factory FavouritesResponseDto.fromJson(Map<String, dynamic> json) {
    return _$FavouritesResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FavouritesResponseDtoToJson(this);
  }
}
