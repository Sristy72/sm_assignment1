import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_texts.dart';
import '../../widget/button.dart';
import '../../widget/text_button.dart';
import '../../widget/texts.dart';
import '../routes/app_routes.dart';

class EnableLocationScreen extends StatelessWidget {
  const EnableLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final width = size.width;

    final isTablet = width >= 600;

    final horizontalPadding = isTablet ? width * 0.2 : 24.0;
    final imageHeight = size.height * (isTablet ? 0.25 : 0.3);
    final spacingSmall = size.height * (isTablet ? 0.03 : 0.04);
    final spacingLarge = size.height * (isTablet ? 0.05 : 0.05);

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 16,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: imageHeight,
                        child: Image.asset('assets/images/img_5.png'),
                      ),

                      SizedBox(height: spacingSmall),

                      CustomText(
                        AppTexts.enableLocationTitle,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: isTablet ? 28 : null,
                        ),
                        align: TextAlign.center,
                      ),

                      SizedBox(height: 12),

                      CustomText(
                        AppTexts.enableLocationSubtitle,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                          fontSize: isTablet ? 18 : null,
                        ),
                        align: TextAlign.center,
                      ),

                      SizedBox(height: spacingLarge),

                      CustomButton(
                        text: "Enable",
                        onPressed: () {
                          // Add location logic
                        },
                      ),

                      SizedBox(height: 16),

                      textButton(
                        text: 'Skip, Not Now',
                        onPressed: () {
                          Get.toNamed(AppRoutes.languageSelection);
                        },
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: isTablet ? 40 : 24),
                    ],
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
