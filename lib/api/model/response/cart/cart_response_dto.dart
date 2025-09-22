import 'package:ecommerce/api/model/response/cart/data_dto.dart';
import 'package:ecommerce/api/model/response/products/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_response_dto.g.dart';

@JsonSerializable()
class CartResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "numOfCartItems")
  final int? numOfCartItems;
  @JsonKey(name: "cartId")
  final String? cartId;
  @JsonKey(name: "data")
  final DataDto? data;

  CartResponseDto ({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  factory CartResponseDto.fromJson(Map<String, dynamic> json) {
    return _$CartResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartResponseDtoToJson(this);
  }
}

