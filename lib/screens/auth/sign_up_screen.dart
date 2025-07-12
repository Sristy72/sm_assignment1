import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_assignment1/widget/password.dart';
import 'package:sm_assignment1/widget/text_button.dart';
import 'package:sm_assignment1/widget/texts.dart';
import '../../constants/app_texts.dart';
import '../../controller/auth_controller.dart';
import '../../utils/validator.dart';
import '../../widget/back_button.dart';
import '../../widget/button.dart';
import '../../widget/strong_password.dart';
import '../../widget/text_field.dart';

class SignUpScreen extends GetView<AuthController> {
  const SignUpScreen({super.key});

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
                key: controller.signUpFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      width: 60,
                      height: 60,
                      alignment: Alignment.center, // ensures icon is centered
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade400, width: 1.5),
                      ),
                      child: CustomBackButton(),
                    ),

                    const SizedBox(height: 20),

                    // Title
                    CustomText(
                      AppTexts.welcomeToEduline,
                      style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 8),

                    // Subtitle
                    CustomText(
                      AppTexts.signUpSubtitle,
                      style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                    ),

                    const SizedBox(height: 32),

                    // Email
                    CustomText(AppTexts.mailText),
                    const SizedBox(height: 8),
                    CustomTextField(
                      hint: "Enter your email",
                      controller: controller.signupEmailController,
                      validator: Validators.email,
                    ),

                    const SizedBox(height: 20),

                    // Full Name
                    Text(AppTexts.nameText),
                    const SizedBox(height: 8),
                    CustomTextField(
                      hint: "Enter your name",
                      controller: controller.nameController,
                      validator: Validators.name,
                    ),

                    const SizedBox(height: 20),

                    // Password
                    Text(AppTexts.passText),
                    const SizedBox(height: 8),
                    Password(
                      hint: 'Enter new password',
                      visibility: controller.isConfirmPasswordVisible,
                      textController: controller.signupPasswordController,
                      onChanged: controller.updatePasswordStrength,
                      validator: (val) =>
                      val == null || val.length < 6 ? 'Minimum 6 characters required' : null,
                    ),
                    const SizedBox(height: 8),
                    StrongPassword(controller: controller),

                    const SizedBox(height: 40),

                    // Sign Up Button
                    CustomButton(
                      text: 'Sign Up',
                      onPressed: controller.signUp,
                    ),

                    const Spacer(),

                    // Bottom Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(AppTexts.alreadyText),
                        textButton(
                          text: "Sign In",
                          onPressed: controller.goToSignin,
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
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