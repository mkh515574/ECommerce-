import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class ColorItem extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const ColorItem({
    super.key,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: color,
        child: isSelected
            ? Icon(Icons.check, color: AppColors.whiteColor, size: 30)
            : Container(),
      ),
    );
  }
}
