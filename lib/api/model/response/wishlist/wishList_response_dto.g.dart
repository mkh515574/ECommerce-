// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishList_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishListResponseDto _$WishListResponseDtoFromJson(Map<String, dynamic> json) =>
    WishListResponseDto(
      status: json['status'] as String?,
      count: (json['count'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WishListResponseDtoToJson(
  WishListResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'count': instance.count,
  'data': instance.data,
};
