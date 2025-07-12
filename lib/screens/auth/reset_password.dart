import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_assignment1/widget/password.dart';
import '../../controller/auth_controller.dart';
import '../../constants/app_texts.dart';
import '../../widget/button.dart';
import '../../widget/texts.dart';
import '../../widget/back_button.dart';

class ResetPasswordScreen extends GetView<AuthController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: size.height - 32),
            child: IntrinsicHeight(
              child: Form(
                key: controller.resetFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      width: 60,
                      height: 60,
                      alignment: Alignment.center,
                      child: const CustomBackButton(),
                    ),

                    const SizedBox(height: 26),

                    // Title
                    Center(
                      child: CustomText(
                        AppTexts.resetPassword,
                        style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Subtitle
                    Center(
                      child: CustomText(
                        AppTexts.resetPasswordSubtitle,
                        style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // New Password
                    CustomText('New Password'),
                    const SizedBox(height: 8),
                    Password(
                      hint: 'Enter new password',
                      visibility: controller.isNewPasswordVisible,
                      textController: controller.newPasswordController,
                      validator: (val) =>
                      val == null || val.length < 6 ? 'Minimum 6 characters required' : null,
                    ),

                    const SizedBox(height: 20),

                    // Confirm Password
                    CustomText('Confirm New Password'),
                    const SizedBox(height: 8),
                    Password(
                      hint: 'Re-enter new password',
                      visibility: controller.isConfirmPasswordVisible,
                      textController: controller.confirmPasswordController,
                      validator: (val) {
                        if (val == null || val.isEmpty) return 'Confirm password is required';
                        if (val != controller.newPasswordController.text) return 'Passwords do not match';
                        return null;
                      },
                    ),

                    const SizedBox(height: 40),

                    // Submit Button
                    CustomButton(
                      text: 'Submit',
                      onPressed: controller.resetPassword,
                    ),

                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
