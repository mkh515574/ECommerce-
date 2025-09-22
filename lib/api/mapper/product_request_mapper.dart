import 'package:ecommerce/api/model/request/product_request_dto.dart';
import 'package:ecommerce/domain/entities/request/product_request.dart';

extension ProductRequestDtoMapper on ProductRequest{

  ProductRequestDto toProductRequest(){
    return ProductRequestDto(
      productId: productId
    );
  }
}