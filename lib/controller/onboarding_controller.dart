import 'package:get/get.dart';
import '../constants/app_texts.dart';
import '../routes/app_routes.dart';

class OnboardingController extends GetxController {
  final currentIndex = 0.obs;

  final onboardingData = [
    {
      'image': 'assets/images/img.png',
      'title': AppTexts.onboarding1Title,
      'subtitle': AppTexts.onboarding1Subtitle,
      'button': 'Next',
    },
    {
      'image': 'assets/images/img_1.png',
      'title': AppTexts.onboarding2Title,
      'subtitle': AppTexts.onboarding2Subtitle,
      'button': 'Get Started',
    },
  ];

  void next() {
    if (currentIndex.value < onboardingData.length - 1) {
      currentIndex.value++;
    } else {
      Get.offNamed(AppRoutes.signin);
    }
  }
}
