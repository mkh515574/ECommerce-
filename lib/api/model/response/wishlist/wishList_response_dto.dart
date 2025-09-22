import 'package:ecommerce/api/model/response/products/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wishList_response_dto.g.dart';

@JsonSerializable()
class WishListResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "data")
  final List<ProductDto>? data;

  WishListResponseDto ({
    this.status,
    this.count,
    this.data,
  });

  factory WishListResponseDto.fromJson(Map<String, dynamic> json) {
    return _$WishListResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WishListResponseDtoToJson(this);
  }
}
