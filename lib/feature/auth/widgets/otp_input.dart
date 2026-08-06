import 'package:flutter/material.dart';
import 'package:nemo/feature/auth/widgets/auth_title.dart';
import 'package:nemo/res/app_colors.dart';
import 'package:nemo/res/text_style.dart';
import 'package:pinput/pinput.dart';

class OtpInput extends StatefulWidget {
  const OtpInput({super.key});

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  @override
  Widget build(BuildContext context) {
    final defaultpinTheme = PinTheme(
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

    final focusedPinTheme = defaultpinTheme.copyDecorationWith(
      border: const Border(
        bottom: BorderSide(
          color: AppColors.primary,
          width: 2,
        ),
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.backLoginIconBackground,
      appBar: AppBar(
        backgroundColor: AppColors.appDropdownFill,
        leading: IconButton(
          color: AppColors.iconTheme,
         
            onPressed: () {
              Navigator.pop(context);
            },
            icon: BackButton()),

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 40,),
            AuthTitle(
              title: "Enter code sent \nto your Number", 
              subtitle: "we sent it the number +91 987 654 3210"
              
            ),
            SizedBox(height: 50,),
            Pinput(
              length: 4,
              defaultPinTheme: defaultpinTheme,
              focusedPinTheme: focusedPinTheme,
            ),
            SizedBox(height: 60,),

            Center(
              child: Text(
                "Resend code in 00:43",
                style: AppTextStyles.body4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}