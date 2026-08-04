import 'package:flutter/material.dart';
import 'package:nemo/feature/on_boarding/cubit/onboarding_cubit.dart';
import 'package:nemo/feature/on_boarding/widgets/next_button.dart';
import 'package:nemo/feature/on_boarding/widgets/page_indicator.dart';
import 'package:nemo/res/app_colors.dart';

class OnboardingBottomCard extends StatelessWidget {
  final OnboardingCubit cubit;

  const OnboardingBottomCard({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            cubit.pages[cubit.currentPage].title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            cubit.pages[cubit.currentPage].description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 26),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PageIndicator(
                controller: cubit.pageController,
                count: cubit.pages.length,
              ),
              const NextButton(),
            ],
          ),
        ],
      ),
    );
  }
}
