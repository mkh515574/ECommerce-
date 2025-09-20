import 'package:ecommerce/api/mapper/category_mapper.dart';
import 'package:ecommerce/api/mapper/subcategory_mapper.dart';
import 'package:ecommerce/api/model/response/products/product_dto.dart';
import 'package:ecommerce/domain/entities/response/products/product.dart';

extension ProductMapper on ProductDto {
  Product toProduct() {
    return Product(
      slug: slug,
      imageCover: imageCover,
      images: images,
      price: price,
      quantity: quantity,
      id: id,
      sold: sold,
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      title: title,
      description: description,
      category: category?.toCategory(),
      brand: category?.toCategory(),
      createdAt: createdAt,
      updatedAt: updatedAt,
      subcategory: subcategory
          ?.map((subcategoryDto) => subcategoryDto.toSubCategory())
          .toList(),
    );
  }
}
