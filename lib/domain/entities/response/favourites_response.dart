
import 'package:ecommerce/domain/entities/response/product.dart';

class FavouritesResponse{
  final String? status;
  final int? count;
  final List<Product>? data;

  FavouritesResponse ({
    this.status,
    this.count,
    this.data,
  });


}
