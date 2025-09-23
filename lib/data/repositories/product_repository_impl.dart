import 'package:ecommerce/data/data_sources/remote/product_remote_data_source.dart';
import 'package:ecommerce/domain/entities/response/product.dart';
import 'package:ecommerce/domain/repositories/products/product_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository{
  ProductRemoteDataSource remoteDataSource ;
  ProductRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<Product>?> getAllProducts() {
    return remoteDataSource.getAllProducts();
  }

}