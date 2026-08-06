import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nemo/feature/auth/screens/login_screen.dart';
import 'package:nemo/feature/on_boarding/widgets/onboardign_page.dart';
import 'package:nemo/feature/on_boarding/widgets/onboarding_bottom_card.dart';
import 'package:nemo/res/app_colors.dart';
import '../cubit/onboarding_cubit.dart';
import '../cubit/onboarding_state.dart';
import 'package:nemo/utils/locale/locale_cubit.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingFinished) {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute (
                builder: (_) => const LoginScreen(),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = OnboardingCubit.get(context);
          final localeCubit = context.read<LocaleCubit>();
          final currentLocale = context.watch<LocaleCubit>().state;

          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Stack(
                children: [
                  Container(
                    color: AppColors.primary.withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 70,
                        bottom: 190,
                      ),
                      child: PageView.builder(
                          controller: cubit.pageController,
                          itemCount: cubit.pages.length,
                          onPageChanged: cubit.changePage,
                          itemBuilder: (context, index) {
                            return OnboardignPage(model: cubit.pages[index]);
                          }),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PopupMenuButton<LocaleApp>(
                          onSelected: (value) {
                            localeCubit.changeLocale(value);
                          },
                          itemBuilder: (context) => const [
                            PopupMenuItem(
                              value: LocaleApp.en,
                              child: Text("English"),
                            ),
                            PopupMenuItem(
                              value: LocaleApp.ar,
                              child: Text("العربية"),
                            ),
                          ],
                          child: Row(
                            children: [
                              Text(currentLocale.languageCode.toUpperCase()),
                              const Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Skip
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: OnboardingBottomCard(cubit: cubit),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
