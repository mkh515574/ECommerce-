
import 'package:ecommerce/domain/entities/response/cart/products.dart';

class Data{
  final String? id;
  final String? cartOwner;
  final List<Products>? products;
  final String? createdAt;
  final String? updatedAt;
  final int? V;
  final int? totalCartPrice;

  Data ({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.V,
    this.totalCartPrice,
  });


}
