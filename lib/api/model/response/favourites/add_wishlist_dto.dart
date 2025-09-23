import 'package:json_annotation/json_annotation.dart';

part 'add_wishlist_dto.g.dart';

@JsonSerializable()
class AddWishListDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<String>? data;

  AddWishListDto ({
    this.status,
    this.message,
    this.data,
  });

  factory AddWishListDto.fromJson(Map<String, dynamic> json) {
    return _$AddWishListDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddWishListDtoToJson(this);
  }
}


