import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';

class ImageSliderWithIndicator extends StatefulWidget {
  final List<String> imageUrls;
  final double height;
  final Duration autoPlayInterval;

  const ImageSliderWithIndicator({
    super.key,
    required this.imageUrls,
    this.height = 200,
    this.autoPlayInterval = const Duration(seconds: 3),
  });

  @override
  State<ImageSliderWithIndicator> createState() =>
      _ImageSliderWithIndicatorState();
}

class _ImageSliderWithIndicatorState extends State<ImageSliderWithIndicator> {
  late final PageController _controller;
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = PageController();

    // تشغيل الـ AutoPlay
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(widget.autoPlayInterval, (timer) {
      if (_controller.hasClients) {
        int nextPage = (_currentIndex + 1) % widget.imageUrls.length;
        _controller.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [

        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.imageUrls.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.primary30Opacity,
                    width: 2,
                  )

                ),

                child: Image.network(
                  widget.imageUrls[index],
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.imageUrls.length,
                (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 10),
              width: _currentIndex == index ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? AppColors.primaryColor
                    : Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
