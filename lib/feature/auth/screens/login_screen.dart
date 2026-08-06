import 'package:flutter/material.dart';
import 'package:nemo/core/widgets/app_button.dart';
import 'package:nemo/feature/auth/widgets/auth_title.dart';
import 'package:nemo/feature/auth/widgets/otp_input.dart';
import 'package:nemo/res/app_colors.dart';
import 'package:nemo/res/text_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            AuthTitle(
                title: "Enter your\nMobile Number",
                subtitle: "we will send you a confirmation code"),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                  prefixText: "+020 ",
                  prefixStyle: AppTextStyles.headline2
                      .copyWith(color: AppColors.toastBackground),
                  hintText: "000 000 000",
                  hintStyle: AppTextStyles.headline2
                      .copyWith(color: AppColors.labelSmall)),
            ),
            SizedBox(
              height: 30,
            ),
            AppButton(
              text: "Next",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const OtpInput(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
