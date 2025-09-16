import 'package:ecommerce/api/mapper/category_mapper.dart';
import 'package:ecommerce/data/data_sources/remote/category_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/response/category/category.dart';
import '../../web_services.dart';

@Injectable(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  WebServices webServices;
  CategoryRemoteDataSourceImpl({required this.webServices});

  @override
  Future<List<Category>?> getAllCategory() async {
    // TODO: implement getAllCategory

    var categoryResponse = await webServices.getAllCategory();

    return categoryResponse.data
            ?.map((categoryDto) => categoryDto.toCategory())
            .toList() ??
        [];
  }
}
