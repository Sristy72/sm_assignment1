import 'package:get/get.dart';
import 'package:sm_assignment1/screens/auth/sign_up_screen.dart';
import 'package:sm_assignment1/screens/auth/verify_code.dart';
import 'package:sm_assignment1/screens/enable_location.dart';
import 'package:sm_assignment1/screens/splash/splash_screen.dart';
import '../bindings/onboarding_binding.dart';
import '../screens/auth/forgot_password.dart';
import '../screens/auth/reset_password.dart';
import '../screens/auth/sign_in_screen.dart';
import '../screens/language_selection_screen.dart';
import '../screens/on_boarding/onboarding_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => const Splash1()),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(name: AppRoutes.signin, page: () => SignInScreen()),
    GetPage(name: AppRoutes.signup, page: () => const SignUpScreen()),
    GetPage(name: AppRoutes.forgotPassword, page: () => const ForgotPasswordScreen()),
    GetPage(name: AppRoutes.resetPassword, page: () => const ResetPasswordScreen()),
    GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCodeScreen()),
    GetPage(name: AppRoutes.enableLocation, page: () => const EnableLocationScreen()),
    GetPage(name: AppRoutes.languageSelection, page: () => const LanguageSelectionScreen()),
  ];
}
