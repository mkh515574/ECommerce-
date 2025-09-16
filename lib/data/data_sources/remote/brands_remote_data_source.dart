import 'package:ecommerce/domain/entities/response/category/category.dart';


abstract class BrandsRemoteDataSource {
  Future<List<Category>?> getAllBrands();
}
