import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteListItem extends StatelessWidget {
  const FavouriteListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.h ,
      margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
      padding: EdgeInsets.only(right: 5,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.w),
        border: Border.all(
          width: 2,
          color: AppColors.primary30Opacity
        )

      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.w),
            child: Image.asset(
              "assets/images/Frame 58.png",
              width: 120.w,
              height: 125.h,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      "Nike Air Jordon",
                      style: AppStyles.medium18Header,
                      maxLines: 1,
                    ),
                    Image.asset(AppAssets.unSelectedAddToFavouriteIcon)
                  ],
                ),

                Row(
                  children: [
                    CircleAvatar(radius: 10.r, backgroundColor: AppColors.blackColor),
                    SizedBox(
                      width: 10.w,
                    ),
                    AutoSizeText("Black Color")
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildPriceText(
                    price: "180",
                    oldPrice: "200",
                  ),
            
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical:8.h),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(16.w),
                    ),
                    child: Text("Add To Cart",style: AppStyles.semi20Primary.copyWith(color: AppColors.whiteColor,fontSize: 16),),
                  )
                ],
              ),
                SizedBox(
                  height: 10.h,
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
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
