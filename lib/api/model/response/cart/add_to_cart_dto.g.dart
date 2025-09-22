// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartDto _$AddToCartDtoFromJson(Map<String, dynamic> json) => AddToCartDto(
  status: json['status'] as String?,
  message: json['message'] as String?,
  numOfCartItems: (json['numOfCartItems'] as num?)?.toInt(),
  cartId: json['cartId'] as String?,
  data: json['data'] == null
      ? null
      : DataDto.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AddToCartDtoToJson(AddToCartDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'numOfCartItems': instance.numOfCartItems,
      'cartId': instance.cartId,
      'data': instance.data,
    };
