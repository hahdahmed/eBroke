import 'package:flutter/material.dart';
import 'package:nemo/res/text_style.dart';

class AuthTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
       
      children: [
        Text(
          title,
          style: AppTextStyles.headline2,
        ),
        SizedBox(height: 6,),
        Text(
          subtitle,
          style: AppTextStyles.body3,
        ),
      ],
    );
  }
}
