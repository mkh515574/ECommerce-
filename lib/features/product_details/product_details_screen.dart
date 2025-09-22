import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/domain/entities/response/cart/products.dart';
import 'package:ecommerce/domain/entities/response/products/product.dart';
import 'package:ecommerce/features/product_details/widgets/product_details_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_styles.dart';

class ProductDetailsScreen extends StatelessWidget {

  const ProductDetailsScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    var product =ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
        ),

        title: Text(
          "Product Details",
          style: AppStyles.medium14PrimaryDark.copyWith(fontSize: 18),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(AppAssets.searchIcon),
          ),
          SizedBox(width: 16.w),
          GestureDetector(
            onTap: () {},
            child: Image.asset(AppAssets.shoppingCart),
          ),

          SizedBox(width: 16.w),
        ],
        centerTitle: true,
      ),
      body: ProductDetailsScreenBody(product: product,),
    );
  }
}
