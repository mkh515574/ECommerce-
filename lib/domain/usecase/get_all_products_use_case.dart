
import 'package:ecommerce/domain/entities/response/products/product.dart';
import 'package:ecommerce/domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCase {
  ProductsRepository productsRepository;
  GetAllProductsUseCase({required this.productsRepository});

  Future<List<Product>?> invoke() {
    return productsRepository.getAllProducts();
  }
}
