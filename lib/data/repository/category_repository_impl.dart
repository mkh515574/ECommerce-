
 import 'package:ecommerce/data/data_sources/remote/category_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/response/category/category.dart';
import '../../domain/repository/category_repository.dart';

@Injectable(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository{
  CategoryRemoteDataSource remoteDataSource;
  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Category>?> getAllCategory() {
    // TODO: implement getAllCategory
    return remoteDataSource.getAllCategory();
  }

}