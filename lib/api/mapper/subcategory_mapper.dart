import 'package:ecommerce/api/model/response/products/subcategory_dto.dart';
import 'package:ecommerce/domain/entities/response/products/subcategory.dart';

extension SubcategoryMapper on SubcategoryDto{
  Subcategory toSubCategory(){
    return Subcategory(
      slug: slug,
      name: name,
      id: id,
      category: category,
    );
  }
}