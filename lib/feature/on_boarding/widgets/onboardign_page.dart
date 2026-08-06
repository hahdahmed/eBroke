import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nemo/feature/on_boarding/models/onboarding_model.dart';
 
class OnboardignPage extends StatelessWidget {
  final OnboardingModel model;

  const OnboardignPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 339,
      height: 300,
      // color: AppColors.primary.withOpacity(0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(model.image),
        ],
      ),
    );
  }
}
