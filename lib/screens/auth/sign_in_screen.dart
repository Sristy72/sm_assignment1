import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_assignment1/widget/texts.dart';
import '../../constants/app_texts.dart';
import '../../controller/auth_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/validator.dart';
import '../../widget/button.dart';
import '../../widget/password.dart';
import '../../widget/text_button.dart';
import '../../widget/text_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final controller = Get.find<AuthController>(); // Access AuthController

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
                key: controller.signInFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 60,
                            child: Image.asset('assets/images/img_2.png'),
                          ),
                          const SizedBox(height: 15),
                          CustomText(
                            AppTexts.welcomeBack,
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomText(
                            AppTexts.signInSubtitle,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    Text(AppTexts.mailText),
                    const SizedBox(height: 8),
                    CustomTextField(
                      hint: "Enter your email",
                      controller: controller.emailController,
                      validator: Validators.email,
                    ),

                    const SizedBox(height: 20),

                    Text(AppTexts.passText),
                    const SizedBox(height: 8),
                    Password(
                      hint: 'Enter new password',
                      visibility: controller.isPasswordVisible,
                      textController: controller.passwordController,
                      validator: (val) =>
                      val == null || val.length < 6 ? 'Minimum 6 characters required' : null,
                    ),

                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Obx(() => Checkbox(
                              value: controller.isRememberMe.value,
                              onChanged: controller.toggleRememberMe,
                              activeColor: Colors.blue,
                              checkColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            )),
                            const Text("Remember me"),
                          ],
                        ),
                        textButton(
                          text: 'Forgot Password',
                          onPressed: controller.goToForgotPassword,
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    CustomButton(
                      text: 'Sign In',
                      onPressed: controller.signIn,
                    ),

                    const Spacer(),

                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(AppTexts.theoryText, style: TextStyle(color: Colors.grey[600], fontSize: 16),),
                          textButton(text: 'Create Account', style: TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold), onPressed: controller.createAccount)
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),
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
