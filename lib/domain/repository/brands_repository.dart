import '../entities/response/category/category.dart';

abstract class BrandsRepository{
  Future<List<Category>?> getAllBrands();
}