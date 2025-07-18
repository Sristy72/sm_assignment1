import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../controller/auth_controller.dart';
import '../../constants/app_texts.dart';
import '../../widget/button.dart';
import '../../widget/pin_code.dart';
import '../../widget/texts.dart';
import '../../widget/back_button.dart';

class VerifyCodeScreen extends GetView<AuthController> {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    controller.startTimer();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: size.height - 32),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),

                  // Back Button
                  Container(
                    width: 60,
                    height: 60,
                    alignment: Alignment.center,
                    child: const CustomBackButton(),
                  ),

                  const SizedBox(height: 32),

                  // Title
                  Center(
                    child: CustomText(
                      AppTexts.verifyTitle,
                      style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                      align: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Subtitle
                  Center(
                    child: CustomText(
                      'Please enter the code we just sent to email${controller.forgotEmailController.text}',
                      align: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Pin Code Field
                PinCode(controller: controller),

                  const SizedBox(height: 16),

                  // Timer
                  Obx(() => Center(
                    child: Text(
                      controller.timer.value > 0
                          ? "Resend code in 00:${controller.timer.value.toString().padLeft(2, '0')}"
                          : "Resend code in 00:${controller.timer.value.toString().padLeft(2, '0')}",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: controller.timer.value > 0 ? Colors.grey : theme.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),

                  const SizedBox(height: 40),

                  // Continue Button
                  CustomButton(
                    text: "Continue",
                    onPressed: controller.verifyCode,
                  ),

                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


