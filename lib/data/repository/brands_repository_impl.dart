
import 'package:injectable/injectable.dart';

import '../../domain/entities/response/category/category.dart';
import '../../domain/repository/brands_repository.dart';
import '../data_sources/remote/brands_remote_data_source.dart';

@Injectable(as: BrandsRepository)
class BrandsRepositoryImpl implements BrandsRepository{
  BrandsRemoteDataSource remoteDataSource;
  BrandsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Category>?> getAllBrands() {
    // TODO: implement getAllCategory
    return remoteDataSource.getAllBrands();
  }

}