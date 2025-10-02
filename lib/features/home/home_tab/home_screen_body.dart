
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/features/home/home_tab/widgets/brand_grid_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_app_bar.dart';
import 'widgets/carousel_slider_widgets.dart';
import 'widgets/category_grid_builder.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(),
            CarouselSliderWidgets(),
            _buildDividerText(text: "Categories"),
            CategoryGridBuilder(),
            _buildDividerText(text: "Brands"),
            BrandGridBuilder(),
          ],
        ),
      ),
    );
  }
}

Widget _buildDividerText({required String text, VoidCallback? onTap}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: AppStyles.medium18Header),
        TextButton(
          onPressed: onTap,
          child: Text("view all", style: AppStyles.medium14PrimaryDark),
        ),
      ],
    ),
  );
}
