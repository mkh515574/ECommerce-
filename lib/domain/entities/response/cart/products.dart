
import 'package:ecommerce/domain/entities/response/products/product.dart';

class Products {
  final int? count;
  final String? id;
  final Product? product;
  final int? price;

  Products ({
    this.count,
    this.id,
    this.product,
    this.price,
  });

}