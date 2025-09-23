// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourites_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavouritesResponseDto _$FavouritesResponseDtoFromJson(
  Map<String, dynamic> json,
) => FavouritesResponseDto(
  status: json['status'] as String?,
  count: (json['count'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FavouritesResponseDtoToJson(
  FavouritesResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'count': instance.count,
  'data': instance.data,
};
