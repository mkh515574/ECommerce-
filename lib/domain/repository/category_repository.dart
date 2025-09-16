import '../entities/response/category/category.dart';

abstract class CategoryRepository{

  Future<List<Category>?> getAllCategory();
}