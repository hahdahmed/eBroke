import 'package:flutter/material.dart';
import 'package:nemo/feature/auth/widgets/auth_title.dart';
import 'package:nemo/feature/auth/widgets/otp_input.dart';
import 'package:nemo/res/app_colors.dart';
import 'package:nemo/res/text_style.dart';
 
class OptScreen extends StatelessWidget {
  const OptScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              height: 40,
            ),
            AuthTitle(
                title: "Enter code sent \nto your Number",
                subtitle: "we sent it the number +91 987 654 3210"),
            SizedBox(
              height: 50,
            ),
            OtpInput(),
            SizedBox(
              height: 60,
            ),
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
 