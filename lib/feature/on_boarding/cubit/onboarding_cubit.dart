import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nemo/feature/on_boarding/cubit/onboarding_state.dart';
import '../models/onboarding_model.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  static OnboardingCubit get(BuildContext context) => BlocProvider.of(context);

  final PageController pageController = PageController();

  int currentPage = 0;

  final List<OnboardingModel> pages = [
    OnboardingModel(
      image: "assets/onboarding/onbo_a 1.svg",
      title: "Welcome To eBroker",
      description:
          "Find the ideal place according to your \n needs and expectations.",
    ),
    OnboardingModel(
      image: "assets/onboarding/onbo_b 1.svg",
      title: "Find your Best Property",
      description:
          "You can search thousand property,\n for your life in this platform \n with easy and fast",
    ),
    OnboardingModel(
      image: "assets/onboarding/onbo_c 1.svg",
      title: "Buy & Sell",
      description: "Buy & sell your expected house \n from phone with eBroker",
    ),
  ];

  void changePage(int index) {
    currentPage = index;
    emit(OnboardingPageChanged());
  }

  void nextPage() {
    if (currentPage < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      emit(OnboardingFinished());
    }
  }
}
