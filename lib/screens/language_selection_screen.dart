import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_assignment1/widget/texts.dart';

import '../controller/language_controller.dart';
import '../model/language_model.dart';
import '../widget/back_button.dart';
import '../widget/button.dart';
import '../widget/languagetile.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageController ctrl = Get.put(LanguageController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              child: const CustomBackButton(),
            ),
            const CustomText(
              'What is Your Mother Language',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const CustomText(
              'Discover what is a podcast description and podcast summary.',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 24),

            Expanded(
              child: ListView.builder(
                itemCount: ctrl.languages.length,
                itemBuilder: (context, index) {
                  return Obx(() {
                    final isSelected = ctrl.selectedIndex.value == index;
                    final LanguageModel lang = ctrl.languages[index];
                    return LanguageTile(
                      model: lang,
                      isSelected: isSelected,
                      onTap: () => ctrl.selectLanguage(index),
                    );
                  });
                },
              ),
            ),

            // Continue button reacts only to selection
            Obx(() {
              return CustomButton(
                text: 'Continue',
                onPressed: (){},
                color: ctrl.isLanguageSelected ? Colors.blue : Colors.blue,
              );
            }),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
