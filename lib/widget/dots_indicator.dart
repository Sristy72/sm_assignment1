import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/onboarding_controller.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({
    super.key,
    required this.controller,
  });

  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        controller.onboardingData.length,
            (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: controller.currentIndex.value == index ? 8 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: controller.currentIndex.value == index
                ? Colors.blue
                : Colors.grey[400],
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}