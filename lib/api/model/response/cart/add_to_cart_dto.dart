import 'package:json_annotation/json_annotation.dart';

import 'data_dto.dart';

part 'add_to_cart_dto.g.dart';

@JsonSerializable()
class AddToCartDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "numOfCartItems")
  final int? numOfCartItems;
  @JsonKey(name: "cartId")
  final String? cartId;
  @JsonKey(name: "data")
  final DataDto? data;

  AddToCartDto ({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  factory AddToCartDto.fromJson(Map<String, dynamic> json) {
    return _$AddToCartDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddToCartDtoToJson(this);
  }
}




