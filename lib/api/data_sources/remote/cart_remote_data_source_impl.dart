import 'package:ecommerce/api/mapper/add_to_cart_mapper.dart';
import 'package:ecommerce/api/mapper/cart_response_mapper.dart';
import 'package:ecommerce/api/mapper/product_request_mapper.dart';
import 'package:ecommerce/domain/entities/request/product_request.dart';
import 'package:ecommerce/domain/entities/response/cart/add_to_cart.dart';
import 'package:ecommerce/domain/entities/response/cart/cart_response.dart';
import 'package:injectable/injectable.dart';

import '../../../data/data_sources/remote/cart_remote_data_source.dart';
import '../../web_services.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  WebServices webServices;
  CartRemoteDataSourceImpl({required this.webServices});


  @override
  Future<CartResponse?> getCart(String token) async {
    var cartResponse = await webServices.getCart(token);
    return cartResponse.toCartResponse();


  }

  @override
  Future<AddToCart?> addToCart(String token, ProductRequest product) async {
    final response = await webServices.addToCart(
      token,
      product.toProductRequest(),
    );
    return response.toAddToCart();
  }
}
