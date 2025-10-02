import 'package:ecommerce/domain/entities/response/add_cart_response.dart';
import 'package:ecommerce/domain/entities/response/get_cart_response.dart';

abstract class CartRemoteDataSource{
  Future<AddCartResponse> addCart(String productId);
  Future<GetCartResponse> getItemsCart();
  Future<GetCartResponse> deleteItemsCart(String productId);
  Future<GetCartResponse> updateCountsCart(String productId, int count);

}