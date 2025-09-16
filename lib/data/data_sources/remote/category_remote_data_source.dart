import 'package:ecommerce/domain/entities/response/category/category.dart';


abstract class CategoryRemoteDataSource {
  Future<List<Category>?> getAllCategory();
}
