import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../widget/success_dialog.dart';

class AuthController extends GetxController {
  // ------------------ Sign In ------------------
  final signInFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isPasswordVisible = false.obs;
  final isRememberMe = false.obs;

  // ------------------ Sign Up ------------------
  final signUpFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final signupEmailController = TextEditingController();
  final signupPasswordController = TextEditingController();
  final isSignupPasswordVisible = false.obs;

  // ------------------ Forgot Password ------------------
  final forgotFormKey = GlobalKey<FormState>();
  final forgotEmailController = TextEditingController();

  // ------------------ Reset Password ------------------
  final resetFormKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final isNewPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;

  // ------------------ Password Strength ------------------
  final passwordStrength = 0.0.obs;

  // ------------------ OTP / Verify Code ------------------
  final otpController = TextEditingController();
  final timer = 30.obs; // countdown in seconds
  Timer? _resendTimer;

  // ------------------ Toggle Visibility ------------------
  void togglePassword() => isPasswordVisible.toggle();
  void toggleSignupPassword() => isSignupPasswordVisible.toggle();
  void toggleNewPasswordVisibility() => isNewPasswordVisible.toggle();
  void toggleConfirmPasswordVisibility() => isConfirmPasswordVisible.toggle();
  void toggleRememberMe([bool? value]) => isRememberMe.value = value ?? !isRememberMe.value;

  // ------------------ Auth Logic ------------------
  void signIn() {
    if (signInFormKey.currentState!.validate()) {
      Get.toNamed(AppRoutes.enableLocation);
    }
  }

  void signUp() {
    if (signUpFormKey.currentState!.validate()) {
      Get.dialog(SuccessDialog(imageUrl: 'assets/images/img_3.png', title: 'Successfully Registered', description: 'Your account has been registered successfully, now let’s enjoy our features!', buttonText: 'Continue', showClose: true,), barrierDismissible: false);
    }
  }

  void forgotPassword() {
    if (forgotFormKey.currentState!.validate()) {
      Get.toNamed(AppRoutes.resetPassword);
    }
  }

  void resetPassword() {
    if (resetFormKey.currentState!.validate()) {
      Get.toNamed(AppRoutes.verifyCode);
    }
  }

  void verifyCode() {
    if (otpController.text.length == 4) {
      Get.dialog(SuccessDialog(imageUrl: 'assets/images/img_4.png', title: 'Success', description: 'Your password is succesfully created', buttonText: 'Continue',), barrierDismissible: false);
    } else {
      Get.snackbar(
        "Invalid Code",
        "Please enter the 4-digit verification code sent to your email.",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // ------------------ Timer + Resend ------------------
  void startTimer() {
    _resendTimer?.cancel(); // cancel any previous timer
    timer.value = 60;

    _resendTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timer.value > 0) {
        timer.value--;
      } else {
        resendCode();
        timer.value = 60; // restart timer after resending
      }
    });
  }

  void resendCode() {
    // 📨 Put your actual resend API logic here
    debugPrint("🔁 Code resent automatically");
    // You could show a snackbar or toast if needed
    // Get.snackbar("Code Sent", "A new verification code has been sent.");
  }

  // ------------------ Navigation ------------------
  void createAccount() => Get.toNamed(AppRoutes.signup);
  void goToSignin() => Get.toNamed(AppRoutes.signin);
  void goToForgotPassword() => Get.toNamed(AppRoutes.forgotPassword);

  // ------------------ Password Strength ------------------
  void updatePasswordStrength(String password) {
    double strength = 0;

    if (password.isEmpty) {
      strength = 0;
    } else if (password.length < 6) {
      strength = 0.25;
    } else {
      strength = 0.5;
      final hasLetters = password.contains(RegExp(r'[A-Za-z]'));
      final hasNumbers = password.contains(RegExp(r'[0-9]'));
      final hasSpecials = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

      if (hasLetters && hasNumbers && hasSpecials && password.length >= 6) {
        strength = 1.0;
      } else if (hasLetters && hasNumbers && password.length >= 6) {
        strength = 0.75;
      }
    }

    passwordStrength.value = strength;
  }

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onClose() {
    // Dispose Sign In
    emailController.dispose();
    passwordController.dispose();

    // Dispose Sign Up
    nameController.dispose();
    signupEmailController.dispose();
    signupPasswordController.dispose();

    // Dispose Forgot Password
    forgotEmailController.dispose();

    // Dispose Reset Password
    newPasswordController.dispose();
    confirmPasswordController.dispose();

    // Dispose OTP
    otpController.dispose();
    _resendTimer?.cancel();

    super.onClose();
  }
}
