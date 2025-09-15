import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class ProductTabItem extends StatelessWidget {
  const ProductTabItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 250.h,

      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primary30Opacity, width: 2),
      ),
      child: Column(
        children: [
          _buildImageAndFavourite(imageUrl: "assets/images/Frame 58.png"),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Nike Air Jordon\nNike shoes flexible for wo..",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.medium14PrimaryDark,
                ),
                SizedBox(height: 3.h),
                _buildPriceText(price: "180", oldPrice: "200"),

                SizedBox(height: 3.h),

                _buildRatingAndAddToCart(rating: "4.8", onTap: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildRatingAndAddToCart({
  required String rating,
  required VoidCallback onTap,
}) {
  return Row(
    children: [
      AutoSizeText(
        "Review ($rating)",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppStyles.medium14PrimaryDark,
      ),
      SizedBox(width: 5.w),
      Image.asset(AppAssets.starIcon),
      Spacer(),
      GestureDetector(
        onTap: onTap,
        child: Image.asset(AppAssets.plusIcon, width: 30.w, height: 30.h),
      ),
    ],
  );
}

Widget _buildImageAndFavourite({required String imageUrl}) {
  return Stack(
    alignment: Alignment.topRight,
    children: [
      Image.asset(
        "assets/images/Frame 58.png",
        width: 191.w,
        height: 128.h,
        fit: BoxFit.fill,
      ),
      Image.asset(AppAssets.selectedAddToFavouriteIcon),
    ],
  );
}

Widget _buildPriceText({required String price, required String oldPrice}) {
  return Row(
    children: [
      AutoSizeText(
        "EGP $price",
        style: AppStyles.medium14PrimaryDark,
        maxLines: 1,
      ),
      SizedBox(width: 10.w),
      AutoSizeText(
        "$oldPrice EGP",
        maxLines: 1,

        style: AppStyles.medium14PrimaryDark.copyWith(
          color: AppColors.primary30Opacity,
          decoration: TextDecoration.lineThrough,
          decorationColor: AppColors.primary30Opacity,
          decorationThickness: 2,
        ),
      ),
    ],
  );
}
