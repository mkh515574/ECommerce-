
import 'package:ecommerce/domain/entities/response/category/meta_data.dart';

import '../model/response/category/meta_data_dto.dart';

extension MetaDataMapper on MetadataDto{

  Metadata toMetaData(){
    return Metadata(

      currentPage: currentPage,
      numberOfPages: numberOfPages,
      limit: limit

    );
  }
}