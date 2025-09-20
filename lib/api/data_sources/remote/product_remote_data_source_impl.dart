import 'package:ecommerce/api/mapper/product_mapper.dart';
import 'package:ecommerce/domain/entities/response/products/product.dart';
import 'package:injectable/injectable.dart';

import '../../../data/data_sources/remote/product_remote_data_source.dart';
import '../../web_services.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  WebServices webServices;
  ProductRemoteDataSourceImpl({required this.webServices});

  @override
  Future<List<Product>?> getAllProducts() async {
    // TODO: implement getAllCategory

    var productResponse = await webServices.getAllProducts();

    return productResponse.data
            ?.map((productDto) => productDto.toProduct())
            .toList() ??
        [];
  }
}
