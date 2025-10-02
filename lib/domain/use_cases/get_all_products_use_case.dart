import 'package:ecommerce/domain/entities/response/category.dart';
import 'package:ecommerce/domain/entities/response/product.dart';
import 'package:ecommerce/domain/repositories/brands/brand_repository.dart';
import 'package:ecommerce/domain/repositories/category/category_repository.dart';
import 'package:ecommerce/domain/repositories/products/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCase{
  ProductRepository productRepository ;
  GetAllProductsUseCase({required this.productRepository});

  Future<List<Product>?>invoke(){
    return productRepository.getAllProducts();
  }
}