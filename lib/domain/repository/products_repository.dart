import 'package:ecommerce/domain/entities/response/products/product.dart';


abstract class ProductsRepository{

  Future<List<Product>?> getAllProducts();
}