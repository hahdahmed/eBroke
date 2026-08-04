import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nemo/feature/on_boarding/screens/onboarding_screen.dart';
import 'package:nemo/res/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isBlue = false;

  double logoScale = 20;

  bool showTitle = false;

  bool showTeam = false;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  Future<void> _startAnimation() async {
    // Background + Logo
    await Future.delayed(const Duration(milliseconds: 1200));

    if (!mounted) return;

    setState(() {
      isBlue = true;
      logoScale = 1;
    });

    // App Name
    await Future.delayed(const Duration(milliseconds: 1000));

    if (!mounted) return;

    setState(() {
      showTitle = true;
    });

    // Team Logo
    await Future.delayed(const Duration(milliseconds: 600));

    if (!mounted) return;

    setState(() {
      showTeam = true;
    });

    // Navigate
    await Future.delayed(const Duration(milliseconds: 1200));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const OnboardingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        color: isBlue ? AppColors.primary : Colors.white,
        child: Stack(
          children: [
            /// Logo
            Center(
              child: AnimatedScale(
                scale: logoScale,
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeOutCubic,
                child: SvgPicture.asset(
                  "assets/splash/mainlogo.svg",
                  width: 150,
                ),
              ),
            ),

            /// App Name
            Align(
              alignment: const Alignment(0, 0.35),
              child: AnimatedSlide(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
                offset: showTitle ? Offset.zero : const Offset(0, 0.5),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: showTitle ? 1 : 0,
                  child: SvgPicture.asset(
                    "assets/splash/textlogo.svg",
                    width: 140,
                  ),
                ),
              ),
            ),

            /// Team Logo
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: AnimatedSlide(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  offset: showTeam ? Offset.zero : const Offset(0, 0.5),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: showTeam ? 1 : 0,
                    child: SvgPicture.asset(
                      "assets/splash/wrteam_logo.svg",
                      width: 130,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
