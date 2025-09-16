import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({super.key});

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
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    AutoSizeText(
                      "Nike Air Jordon",
                      style: AppStyles.medium18Header,
                      maxLines: 1,
                    ),
                    Image.asset(AppAssets.removeIcon)
                  ],
                ),

                Row(
                  children: [
                    CircleAvatar(radius: 10.r, backgroundColor: AppColors.orangeColor),
                    SizedBox(
                      width: 10.w,
                    ),
                    AutoSizeText("Orange"),
                    AutoSizeText(" | Size: 40"),


                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    "EGP 3500",
                    style: AppStyles.medium14PrimaryDark,
                    maxLines: 1,
                  ),
                  _buildPlusOrMinsProduct(),
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








Widget _buildPlusOrMinsProduct() {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: BorderRadius.circular(20.w),
    ),
    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildPlusItem(icon: Icons.remove),
        SizedBox(width: 10.w),
        Text(
          "1",
          style: AppStyles.medium14PrimaryDark.copyWith(
            color: AppColors.whiteColor,
            fontSize: 20,
          ),
        ),
        SizedBox(width: 10.w),
        _buildPlusItem(icon: Icons.add),
      ],
    ),
  );
}

_buildPlusItem({IconData? icon}) {
  return Container(
    width: 30,
    height: 30,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: AppColors.whiteColor, width: 2),
    ),
    child: Icon(icon, color: AppColors.whiteColor, size: 20),
  );
}
