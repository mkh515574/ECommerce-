import 'package:ecommerce/api/model/response/category/category_dto.dart';
import 'package:ecommerce/domain/entities/response/category/category.dart';

extension CategoryMapper on CategoryDto{

  Category toCategory(){
    return Category(
      id: id,
      name: name,
      slug: slug,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,

    );

  }
}