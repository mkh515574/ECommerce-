import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../domain/entities/response/category.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;

  const CategoryGridItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50.w),

            child: (category.image == null || category.image!.isEmpty)
                ? Icon(Icons.image_not_supported)
                : Image.network(
                    category.image!,
                    fit: BoxFit.fill,
                    width: 50.w,
                    height: 50.h,
                  ),
          ),
          SizedBox(height: 3.h),
          AutoSizeText(
            category.name ?? "",
            style: AppStyles.medium14Category.copyWith(
              color: AppColors.primaryDark,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],

    );
  }
}
