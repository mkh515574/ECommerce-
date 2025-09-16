import 'package:ecommerce/domain/entities/response/category/category.dart';
import 'package:injectable/injectable.dart';

import '../repository/brands_repository.dart';
@injectable
class GetAllBrandsUseCase {
  BrandsRepository brandsRepository;
  GetAllBrandsUseCase({required this.brandsRepository});

  Future<List<Category>?> invoke() {
    return brandsRepository.getAllBrands();
  }
}
