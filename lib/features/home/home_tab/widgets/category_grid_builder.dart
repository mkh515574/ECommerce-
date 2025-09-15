import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_grid_item.dart';


class CategoryGridBuilder extends StatelessWidget {
  const CategoryGridBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CategoryGridItem(),
        itemCount: 10,
      ),
    );
  }
}
