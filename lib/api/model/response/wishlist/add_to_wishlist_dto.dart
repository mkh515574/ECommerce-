import 'package:json_annotation/json_annotation.dart';

part 'add_to_wishlist_dto.g.dart';

@JsonSerializable()
class AddToWishListDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<String>? data;

  AddToWishListDto ({
    this.status,
    this.message,
    this.data,
  });

  factory AddToWishListDto.fromJson(Map<String, dynamic> json) {
    return _$AddToWishListDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddToWishListDtoToJson(this);
  }
}


