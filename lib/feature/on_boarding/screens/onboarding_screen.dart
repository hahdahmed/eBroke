import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nemo/feature/on_boarding/widgets/onboardign_page.dart';
import 'package:nemo/feature/on_boarding/widgets/onboarding_bottom_card.dart';
import 'package:nemo/res/app_colors.dart';
import 'package:nemo/utils/locale/app_localization.dart';
import 'package:nemo/utils/locale/app_localization_keys.dart';
import '../cubit/onboarding_cubit.dart';
import '../cubit/onboarding_state.dart';
import 'package:nemo/utils/locale/locale_cubit.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          final cubit = OnboardingCubit.get(context);
          final localeCubit = context.read<LocaleCubit>();
          final currentLocale = context.watch<LocaleCubit>().state;

          return Scaffold(
            backgroundColor: AppColors.onboardingbackground,
            body: SafeArea(
              child: Stack(
                children: [
                  Padding(
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
                        /*
                        TextButton(
                          onPressed: () {
                            // Change Language
                          },
                          child:  Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .translate(LocalizationKeys.languageValue)!,
                              ),
                              Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),*/
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
