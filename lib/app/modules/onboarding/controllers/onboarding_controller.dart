import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../../shared/constants/app_constants.dart';

class OnboardingController extends GetxController {
  final currentPage = 0.obs;
  final PageController pageController = PageController();

  List<Map<String, String>> get onboardingContent => AppConstants.onboardingContent;

  void nextPage() {
    if (currentPage.value < onboardingContent.length - 1) {
      currentPage.value++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAllNamed(Routes.DASHBOARD);
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipOnboarding() {
    Get.offAllNamed(Routes.DASHBOARD);
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }
} 