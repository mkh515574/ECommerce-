import 'package:ecommerce/domain/entities/response/cart/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import 'cart_list_builder.dart';

class CartScreenBody extends StatelessWidget {
  final Data data ;
  const CartScreenBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartListBuilder(products: data.products ??[],),
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
                    "EGP ${data.totalCartPrice}",
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
