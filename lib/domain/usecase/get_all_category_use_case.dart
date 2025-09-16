import 'package:ecommerce/domain/entities/response/category/category.dart';
import 'package:ecommerce/domain/repository/category_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetAllCategoryUseCase {
  CategoryRepository categoryRepository;
  GetAllCategoryUseCase({required this.categoryRepository});

  Future<List<Category>?> invoke() {
    return categoryRepository.getAllCategory();
  }
}
