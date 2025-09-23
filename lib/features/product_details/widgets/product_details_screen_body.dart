import 'package:animated_read_more_text/animated_read_more_text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:ecommerce/features/cart/viewModel/cart_view_model.dart';
import 'package:ecommerce/features/product_details/widgets/size_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_styles.dart';
import '../../../domain/entities/response/product.dart';
import 'color_item.dart';
import 'image_slider_with_indcator.dart';

class ProductDetailsScreenBody extends StatefulWidget {
  const ProductDetailsScreenBody({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailsScreenBody> createState() =>
      _ProductDetailsScreenBodyState();
}

class _ProductDetailsScreenBodyState extends State<ProductDetailsScreenBody> {
  int selectedIndex = 0;
  int selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> sizes = ["38", "39", "40", "41", "42"];
    List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSliderWithIndicator(
            imageUrls: widget.product.images ?? [],
            height: 300,
            autoPlayInterval: Duration(seconds: 5),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.product.title ?? "",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,

                  style: AppStyles.medium18Header.copyWith(
                    fontSize: 20,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),

              Text(
                "EGP ${widget.product.price}",
                style: AppStyles.medium18Header.copyWith(
                  fontSize: 20,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          _buildRatingAndAddToCart(
            rating: "${widget.product.ratingsAverage}",
            number: "${widget.product.ratingsQuantity}",
            sold: (widget.product.sold).toString().length >= 5 ? (widget.product.sold).toString().substring(0,5) : "${widget.product.sold.toString()}"
          ),
          SizedBox(height: 16.h),
          AutoSizeText("Description", style: AppStyles.medium18Header),
          SizedBox(height: 8.h),
          AnimatedReadMoreText(
            widget.product.description ?? "",
            maxLines: 2,
            readMoreText: 'Read More',
            readLessText: 'Show Less',
            textStyle: AppStyles.regular14Text,
            buttonTextStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          AutoSizeText("Size", style: AppStyles.medium18Header),

          SizedBox(
            height: 50.h,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => SizeItem(
                size: sizes[index],
                isSelected: selectedIndex == index,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              itemCount: 5,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 10.w);
              },
            ),
          ),
          AutoSizeText("Colors", style: AppStyles.medium18Header),

          SizedBox(
            height: 50.h,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ColorItem(
                color: colors[index],
                isSelected: selectedColorIndex == index,
                onTap: () {
                  setState(() {
                    selectedColorIndex = index;
                  });
                },
              ),
              itemCount: 5,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 10.w);
              },
            ),
          ),
          Spacer(),

          Padding(
            padding: EdgeInsets.only(bottom: 24.h),
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
                      "EGP ${widget.product.price}",
                      style: AppStyles.medium18Header.copyWith(fontSize: 20),
                    ),
                  ],
                ),
                CustomElevatedButton(
                  text: "Add to cart",
                  onPressed: () {

                    CartViewModel.get(context).addToCart(widget.product.id!);

                  },
                  borderSideColor: AppColors.primaryColor,
                  buttonContent: Icon(
                    Icons.shopping_cart_outlined,
                    color: AppColors.whiteColor,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildRatingAndAddToCart({
  required String rating,
  required String number,
  required String sold,
}) {
  return Row(
    children: [
      _buildSoldItem(sold: sold),
      SizedBox(width: 24.w),

      Image.asset(AppAssets.starIcon),
      SizedBox(width: 5.w),

      AutoSizeText(
        "$rating",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppStyles.medium14PrimaryDark,
      ),
      SizedBox(width: 5.w),

      AutoSizeText(
        "($number)",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppStyles.medium14PrimaryDark,
      ),

      Spacer(),

      _buildPlusOrMinsProduct(),
    ],
  );
}

Widget _buildSoldItem({required String sold}) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      border: Border.all(color: Colors.grey.shade400, width: 2),
      borderRadius: BorderRadius.circular(20.w),
    ),
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    child: Text("$sold Sold", style: AppStyles.medium14PrimaryDark,maxLines: 1,),
  );
}

Widget _buildPlusOrMinsProduct() {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: BorderRadius.circular(20.w),
    ),
    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildPlusItem(icon: Icons.remove),
        SizedBox(width: 10.w),
        Text(
          "1",
          style: AppStyles.medium14PrimaryDark.copyWith(
            color: AppColors.whiteColor,
            fontSize: 20,
          ),
        ),
        SizedBox(width: 10.w),
        _buildPlusItem(icon: Icons.add),
      ],
    ),
  );
}

_buildPlusItem({IconData? icon}) {
  return Container(
    width: 30,
    height: 30,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: AppColors.whiteColor, width: 2),
    ),
    child: Icon(icon, color: AppColors.whiteColor, size: 20),
  );
}
