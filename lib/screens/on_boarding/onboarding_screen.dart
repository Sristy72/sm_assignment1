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
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(data['image']!, height: 200),

                const SizedBox(height: 24),

                CustomText(
                  data['title']!,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize:20, fontWeight: FontWeight.bold),
                ),


                const SizedBox(height: 12),

                CustomText(
                  data['subtitle']!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                const Spacer(),


                CircularIndicator(controller: controller),


                const SizedBox(height: 24),
                CustomButton(
                  text: data['button']!, onPressed: controller.next,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}


