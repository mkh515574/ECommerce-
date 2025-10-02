// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_wishlist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddWishListDto _$AddWishListDtoFromJson(Map<String, dynamic> json) =>
    AddWishListDto(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AddWishListDtoToJson(AddWishListDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
