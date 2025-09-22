

import '../products/product.dart';


class WishListResponse{
  final String? status;
  final int? count;
  final List<Product>? data;

  WishListResponse ({
    this.status,
    this.count,
    this.data,
  });


}
