import 'package:ecommerce/api/mapper/category_mapper.dart';
import 'package:injectable/injectable.dart';

import '../../../data/data_sources/remote/brands_remote_data_source.dart';
import '../../../domain/entities/response/category/category.dart';
import '../../web_services.dart';

@Injectable(as: BrandsRemoteDataSource)
class BrandsRemoteDataSourceImpl implements BrandsRemoteDataSource {
  WebServices webServices;
  BrandsRemoteDataSourceImpl({required this.webServices});

  @override
  Future<List<Category>?> getAllBrands() async {
    // TODO: implement getAllCategory

    var brandsResponse = await webServices.getAllBrands(
      10
    );

    return brandsResponse.data
            ?.map((brandsDto) => brandsDto.toCategory())
            .toList() ??
        [];
  }

}
