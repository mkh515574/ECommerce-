import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.borderSideColor,
    this.textStyle,
    required this.text,
    this.buttonContent,
  });

  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? borderSideColor;
  final TextStyle? textStyle;
  final String text;
  final Widget? buttonContent;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(

        padding: EdgeInsets.symmetric(vertical: height * 0.01,horizontal: 20.w),
        backgroundColor: backgroundColor ?? AppColors.primaryColor,

        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: borderSideColor ?? AppColors.whiteColor, width: 1.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buttonContent ?? Container(),
          SizedBox(width: 10,),
          Text(text,style: textStyle??AppStyles.semi20Primary.copyWith(color: AppColors.whiteColor),),
        ],
      ),
    );
  }
}
