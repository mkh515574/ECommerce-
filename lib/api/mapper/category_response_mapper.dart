import 'package:ecommerce/api/mapper/category_mapper.dart';
import 'package:ecommerce/api/mapper/meta_data_mapper.dart';

import '../../domain/entities/response/category/category_response.dart';
import '../model/response/category/category_response_dto.dart';

extension CategoryResponseMapper on CategoryResponseDto{


  CategoryResponse toCategoryResponse(){
    return CategoryResponse(

      results: results,
      metadata: metadata?.toMetaData(),
      data: data?.map((categoryDto) => categoryDto.toCategory()).toList(),
    );
  }
}