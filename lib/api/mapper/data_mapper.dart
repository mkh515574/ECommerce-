import 'package:ecommerce/api/mapper/products_mapper.dart';
import 'package:ecommerce/api/model/response/cart/data_dto.dart';
import 'package:ecommerce/domain/entities/response/cart/data.dart';

extension DataMapper on DataDto{

  Data toData(){
    return Data(
      id: id,
      cartOwner: cartOwner,
      createdAt: createdAt,
      updatedAt: updatedAt,
      totalCartPrice: totalCartPrice,
      V: V,
      products: products?.map((productsDto)=> productsDto.toProducts()).toList(),

    );
  }
}