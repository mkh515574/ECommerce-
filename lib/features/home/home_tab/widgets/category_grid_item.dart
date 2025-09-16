import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/domain/entities/response/category/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';



class CategoryGridItem extends StatelessWidget {

  final Category category;
  const CategoryGridItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40.w,
            backgroundImage: NetworkImage(category.image??""),
          ),
          SizedBox(height: 8.h),

          AutoSizeText(
            category.name??"",
            style: AppStyles.medium14Category.copyWith(
              color: AppColors.primaryDark,
            ),

            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
