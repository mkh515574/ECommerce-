import 'package:ecommerce/api/model/response/cart/add_cart/add_product_dto.dart';
import 'package:ecommerce/domain/entities/response/add_product.dart';

extension AddProductMapper on AddProductDto{
  AddProduct toAddProduct(){
    return AddProduct(
      id: id,
      product: product,
      count: count,
      price: price
    );
  }
}