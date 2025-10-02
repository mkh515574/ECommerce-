import 'package:ecommerce/api/mapper/product_mapper.dart';
import 'package:ecommerce/api/model/response/cart/get_cart/get_products_dto.dart';
import 'package:ecommerce/domain/entities/response/get_products.dart';

extension GetProductsMapper on GetProductsDto{
  GetProducts toGetProducts(){
    return GetProducts(
      id: id,
      price: price,
      count: count,
      product: product!.toProduct()
    );
  }
}