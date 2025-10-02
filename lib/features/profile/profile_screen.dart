import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_assets.dart';
import '../../core/widgets/custom_text_form_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppAssets.routeLogo),
            SizedBox(height: 24.h),
            Text("Welcome, Mohamed", style: AppStyles.medium18Header),
            Text("mohamed.N@gmail.com", style: AppStyles.medium14LightPrimary),

            SizedBox(height: 30.h),
            Text("Your full name", style: AppStyles.medium18Header),
            SizedBox(height: 10.h),
            CustomTextFormField(
              colorBorderSide: AppColors.primary30Opacity,
              controller: TextEditingController(text: "Mohamed Mohamed Nabil"),
              suffixIcon: Image.asset(AppAssets.editIcon),
            ),
            SizedBox(height: 10.h),
            Text("Your E-mail", style: AppStyles.medium18Header),
            SizedBox(height: 10.h),
            CustomTextFormField(
              colorBorderSide: AppColors.primary30Opacity,
              controller: TextEditingController(text: "mohamed.N@gmail.com"),
              suffixIcon: Image.asset(AppAssets.editIcon),
            ),
            Text("Your password", style: AppStyles.medium18Header),
            SizedBox(height: 10.h),
            CustomTextFormField(
              colorBorderSide: AppColors.primary30Opacity,
              obscureText: true,
              controller: TextEditingController(text: "Mohamed Mohamed Nabil"),
              suffixIcon: Image.asset(AppAssets.editIcon),
            ),
            SizedBox(height: 10.h),

            Text("Your mobile number", style: AppStyles.medium18Header),
            SizedBox(height: 10.h),
            CustomTextFormField(
              colorBorderSide: AppColors.primary30Opacity,
              keyboardType: TextInputType.phone,
              controller: TextEditingController(text: "01122118855"),
              suffixIcon: Image.asset(AppAssets.editIcon),
            ),
            SizedBox(height: 10.h),

            Text("Your Address", style: AppStyles.medium18Header),
            SizedBox(height: 10.h),
            CustomTextFormField(
              colorBorderSide: AppColors.primary30Opacity,
              controller: TextEditingController(
                text: "6th October, street 11.....",
              ),

              suffixIcon: Image.asset(AppAssets.editIcon),
            ),
          ],
        ),
      ),
    );
  }
}
