import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/onboarding_controller.dart';
import '../../widget/button.dart';
import '../../widget/dots_indicator.dart';
import '../../widget/texts.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          final data = controller.onboardingData[controller.currentIndex.value];

          return LayoutBuilder(
            builder: (context, constraints) {
              final height = constraints.maxHeight;
              final width = constraints.maxWidth;

              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: height),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.06,
                        vertical: height * 0.04,
                      ),
                      child: Column(
                        children: [
                          // Image
                          Image.asset(
                            data['image']!,
                            height: height * 0.28,
                            fit: BoxFit.contain,
                          ),

                          SizedBox(height: height * 0.04),

                          // Title
                          CustomText(
                            data['title']!,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontSize: height * 0.025,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: height * 0.015),

                          // Subtitle
                          CustomText(
                            data['subtitle']!,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: height * 0.018,
                            ),
                          ),

                          const Spacer(),

                          // Dot Indicator
                          CircularIndicator(controller: controller),

                          SizedBox(height: height * 0.03),

                          // Button
                          CustomButton(
                            text: data['button']!,
                            onPressed: controller.next,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
