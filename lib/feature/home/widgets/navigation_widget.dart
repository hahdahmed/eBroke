import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nemo/res/app_colors.dart';

class NavigationWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NavigationWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black12,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _item("assets/home/home.svg","home" ,0),
          _item("lib/feature/home/screen/chat_screen.dart", "chat", 1),
          _item("assets/home/Buy Sell button.svg", "", 2),
          _item("lib/feature/home/screen/Properties_screen.dart", "properties", 3),
          _item("lib/feature/home/screen/profile_screen.dart", "profile", 4)
        ],
      ),
    );
  }

  Widget _item(String image, String title, int index) {
    return InkWell(
      onTap: ()=> onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            image,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
            currentIndex == index ? AppColors.iconTheme : AppColors.labelSmall,
            BlendMode.srcIn,
          ),

          ),
          const SizedBox(height: 4,),
          Text(
            title,
            style: TextStyle(
              color: currentIndex == index ?  AppColors.iconTheme : AppColors.labelSmall,
            ),
          )
        ],
      ),
    );
  }
}
