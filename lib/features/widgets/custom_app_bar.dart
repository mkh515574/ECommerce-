import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_routes.dart';
import '../../core/utils/app_styles.dart';
import '../../core/widgets/custom_text_form_field.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppAssets.routeLogo),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: TextEditingController(),
                  hintText: "what do you search for?",
                  colorBorderSide: AppColors.primary30Opacity,
                  prefixIcon: Image.asset(AppAssets.searchIcon),
                  hintStyle: AppStyles.light14SearchHint,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.cartRoute);
                },
                child: Badge(
                  alignment: Alignment.topLeft,
                  backgroundColor: AppColors.greenColor,
                  largeSize: 18,
                  label: Text(
                    "2",
                    style: AppStyles.medium18White.copyWith(fontSize: 14),
                  ),
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset(AppAssets.shoppingCart),
                  ),
                ),
              )

            ],
          ),
        ],
      ),
    );
  }
}
