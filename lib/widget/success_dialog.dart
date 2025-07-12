// success_dialog.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_assignment1/widget/button.dart';
import 'package:sm_assignment1/widget/texts.dart';
import '../controller/auth_controller.dart';
import '../routes/app_routes.dart';

class SuccessDialog extends StatelessWidget {
   SuccessDialog({super.key, required this.imageUrl, required this.title, required this.description, required this.buttonText, this.showClose = false});

  String imageUrl;
  String title;
  String description;
  String buttonText;
   final bool showClose;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = Get.find<AuthController>();


    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      insetPadding: const EdgeInsets.all(24),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image + Close button
            Stack(
              children: [
                Center(
                  child: Image.asset(
                    imageUrl, // Replace with your actual image path
                    height: 120,
                  ),
                ),

                if(showClose)
                  Positioned(
                    right: -10,
                    top: -10, // <-- moves the icon upward
                    child: IconButton(
                      icon: const Icon(Icons.close, size: 28,),
                      onPressed: () => Get.back(),
                    ),
                  )
              ],
            ),
            const SizedBox(height: 20),

            // Title
            CustomText(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // Description
            CustomText(
              description,
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            ),

            const SizedBox(height: 24),

            // Continue Button
            SizedBox(
              width: double.infinity,
              child: CustomButton(text: buttonText, onPressed: controller.goToSignin),
            )
          ],
        ),
      ),
    );
  }
}
