import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class SizeItem extends StatelessWidget {
  final String size;
  final bool isSelected;
  final VoidCallback onTap;

  const SizeItem({
    super.key,
    required this.size,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: isSelected
            ? AppColors.primaryColor
            : AppColors.whiteColor,
        child: Text(
          size,
          style: AppStyles.medium14PrimaryDark.copyWith(
            color: isSelected
                ? AppColors.whiteColor
                : AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
