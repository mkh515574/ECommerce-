

import 'package:ecommerce/api/model/response/cart/products_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'data_dto.g.dart';

@JsonSerializable()
class DataDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "cartOwner")
  final String? cartOwner;
  @JsonKey(name: "products")
  final List<ProductsDto>? products;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? V;
  @JsonKey(name: "totalCartPrice")
  final int? totalCartPrice;

  DataDto ({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.V,
    this.totalCartPrice,
  });

  factory DataDto.fromJson(Map<String, dynamic> json) {
    return _$DataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataDtoToJson(this);
  }
}
