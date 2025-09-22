// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_wishlist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToWishListDto _$AddToWishListDtoFromJson(Map<String, dynamic> json) =>
    AddToWishListDto(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AddToWishListDtoToJson(AddToWishListDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
