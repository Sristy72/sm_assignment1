import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sm_assignment1/widget/texts.dart';

import '../constants/app_texts.dart';
import '../controller/auth_controller.dart';

class StrongPassword extends StatelessWidget {
  const StrongPassword({
    super.key,
    required this.controller,
  });

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      double strength = controller.passwordStrength.value;

      Color color;
      String label;

      if (strength <= 0.25) {
        color = Colors.red;
        label = 'Weak';
      } else if (strength <= 0.5) {
        color = Colors.orange;
        label = 'Medium';
      } else if (strength < 1.0) {
        color = Colors.blue;
        label = 'Good';
      } else {
        color = Colors.green;
        label = 'Strong';
      }

      int activeSegments = (strength * 4).ceil();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Fixed-width segmented progress bar
              SizedBox(
                width: 220,
                child: Row(
                  children: List.generate(4, (index) {
                    bool isActive = index < activeSegments;
                    return Expanded(
                      child: Container(
                        height: 5,
                        margin: EdgeInsets.only(right: index < 3 ? 4 : 0),
                        decoration: BoxDecoration(
                          color: isActive ? color : Colors.grey[300],
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              // Push label to far right
              const Spacer(),

              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          // Helper text
          Row(
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Color(0xFF23AA26),
                size: 16, // You can adjust the size
              ),
              SizedBox(width: 6,),
              Expanded(
                child: CustomText(
                  AppTexts.passwordMsg,
                  style: TextStyle(
                    color: Color(0xFF23AA26),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}