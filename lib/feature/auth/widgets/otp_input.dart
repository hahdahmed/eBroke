import 'package:flutter/material.dart';
import 'package:nemo/feature/home/screen/home_screen1.dart';
import 'package:nemo/res/app_colors.dart';
import 'package:nemo/res/text_style.dart';
import 'package:pinput/pinput.dart';

class OtpInput extends StatelessWidget {
  const OtpInput({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 55,
      height: 60,
      textStyle: AppTextStyles.headline3,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.labelSmall,
            width: 1.5,
          ),
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: const Border(
        bottom: BorderSide(
          color: AppColors.primary,
          width: 2,
        ),
      ),
    );

    return Pinput(
      length: 4,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,

      onCompleted: (pin) =>{
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(
            builder: (_) => const HomeScreen()
          ),
        ),
      }
    );
  }
}
