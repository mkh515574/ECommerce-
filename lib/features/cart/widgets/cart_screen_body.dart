import 'package:ecommerce/features/cart/widgets/cart_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/widgets/custom_elevated_button.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartListBuilder(),
        Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 10.h,
            bottom: 30.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Total price",
                    style: AppStyles.medium14LightPrimary.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "EGP 3,500",
                    style: AppStyles.medium18Header.copyWith(fontSize: 20),
                  ),
                ],
              ),
              CustomElevatedButton(
                text: "Check Out",
                onPressed: () {},
                borderSideColor: AppColors.primaryColor,
                buttonContent: Icon(
                  Icons.arrow_forward,
                  color: AppColors.whiteColor,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
