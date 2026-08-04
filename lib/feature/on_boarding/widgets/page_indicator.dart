import 'package:flutter/material.dart';
import 'package:nemo/res/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatelessWidget {
  final PageController controller;
  final int count;
  const PageIndicator(
      {super.key, required this.controller, required this.count});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: WormEffect(
        dotHeight: 8,
        dotWidth: 8,
        activeDotColor: AppColors.primary,
        dotColor: Colors.grey.shade300,
      ),
    );
  }
}
