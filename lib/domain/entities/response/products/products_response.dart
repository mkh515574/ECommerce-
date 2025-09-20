
import 'package:ecommerce/domain/entities/response/products/product.dart';

import '../category/meta_data.dart';

class ProductsResponse {
  final int? results;
  final Metadata? metadata;
  final List<Product>? data;

  ProductsResponse ({
    this.results,
    this.metadata,
    this.data,
  });


}




