import 'package:ecommerce/api/mapper/product_mapper.dart';

import '../../domain/entities/response/cart/products.dart';
import '../../domain/entities/response/products/product.dart';
import '../model/response/cart/products_dto.dart';

extension ProductsMapper on ProductsDto {
  Products toProducts() {
    return Products(
      count: count,
      id: id,
      price: price,
      product:  product is String
          ? Product(id: product?.id )
          : product?.toProduct()

    );
  }
}
