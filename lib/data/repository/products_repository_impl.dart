
import 'package:ecommerce/domain/entities/response/products/product.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/products_repository.dart';
import '../data_sources/remote/product_remote_data_source.dart';

@Injectable(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository{
  ProductRemoteDataSource remoteDataSource;
  ProductsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Product>?> getAllProducts() {
    // TODO: implement getAllCategory
    return remoteDataSource.getAllProducts();
  }

}