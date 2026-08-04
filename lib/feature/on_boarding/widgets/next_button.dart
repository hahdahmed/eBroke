import 'package:flutter/material.dart';
import 'package:nemo/feature/on_boarding/cubit/onboarding_cubit.dart';
import 'package:nemo/res/app_colors.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        OnboardingCubit.get(context).nextPage();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.doneIconBg,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(18),
        elevation: 0,
      ),
      child: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
        size: 28,
      ),
    );
  }
}
