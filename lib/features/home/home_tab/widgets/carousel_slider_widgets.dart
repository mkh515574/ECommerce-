import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselSliderWidgets extends StatelessWidget {
  CarouselSliderWidgets({super.key});

  final List<Widget> items = [
    Image.asset(AppAssets.announcement1),
    Image.asset(AppAssets.announcement2),
    Image.asset(AppAssets.announcement3),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: CarouselSlider(
        items: items,

        options: CarouselOptions(
          height: 200.h,
          aspectRatio: 16 / 9,
          viewportFraction: 0.99,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index, reason) {},
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
