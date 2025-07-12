import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_assignment1/widget/back_button.dart';
import 'package:sm_assignment1/widget/texts.dart';
import '../../constants/app_texts.dart';
import '../../controller/auth_controller.dart';
import '../../utils/validator.dart';
import '../../widget/button.dart';
import '../../widget/text_field.dart';

class ForgotPasswordScreen extends GetView<AuthController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    // Responsive paddings and font sizes
    double horizontalPadding = size.width * 0.06;
    horizontalPadding = horizontalPadding.clamp(16, 32);

    double titleFontSize = size.width * 0.08;
    titleFontSize = titleFontSize.clamp(22, 32);

    double subtitleFontSize = size.width * 0.04;
    subtitleFontSize = subtitleFontSize.clamp(14, 18);

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 16),
              child: Form(
                key: controller.forgotFormKey,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: CustomBackButton(),
                        ),
                        SizedBox(height: size.height * 0.03),

                        Center(
                          child: Text(
                            AppTexts.forgotPassword,
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: titleFontSize,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),

                        CustomText(
                          AppTexts.forgotPasswordSubtitle,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                            fontSize: subtitleFontSize,
                          ),
                        ),
                        SizedBox(height: size.height * 0.04),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Email Address",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: subtitleFontSize,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),

                        CustomTextField(
                          hint: "Enter your email",
                          controller: controller.forgotEmailController,
                          validator: Validators.email,
                        ),
                        SizedBox(height: size.height * 0.04),

                        CustomButton(
                          text: 'Continue',
                          onPressed: controller.forgotPassword,
                        ),

                        SizedBox(height: size.height * 0.05),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
