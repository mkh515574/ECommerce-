import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/domain/entities/response/products/product.dart';
import 'package:ecommerce/features/cart/viewModel/cart_view_model.dart';
import 'package:ecommerce/features/favourites/viewModel/favourites_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class ProductTabItem extends StatelessWidget {
  final Product product;
  const ProductTabItem({super.key,required this.product});

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
          _buildImageAndFavourite(onTap: (){
            FavouritesViewModel.instance.addToWishList(productId: product.id!);
          }, imageUrl: product.imageCover ?? "",isSelected: FavouritesViewModel.instance.isSelected),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  product.title ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.medium14PrimaryDark,
                ),
                SizedBox(height: 3.h),
                _buildPriceText(price: product.price.toString(), oldPrice: "${(product.price! * 2)}"),

                SizedBox(height: 3.h),

                _buildRatingAndAddToCart(rating: product.ratingsAverage.toString()??"0.0", onTap: () {
                  CartViewModel.instance.addToCart(productId: product.id!);
                }),
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

Widget _buildImageAndFavourite({required String imageUrl,required VoidCallback onTap,required bool isSelected }) {
  return Stack(
    alignment: Alignment.topRight,
    children: [
      Image.network(
        imageUrl,
        width: 191.w,
        height: 128.h,
        fit: BoxFit.fill,
      ),
      GestureDetector(onTap: onTap,child: Image.asset(isSelected ? AppAssets.unSelectedAddToFavouriteIcon :AppAssets.selectedAddToFavouriteIcon)),
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
