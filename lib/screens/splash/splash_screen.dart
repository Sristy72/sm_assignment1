import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../constants/app_texts.dart';
import '../../routes/app_routes.dart';
import '../../widget/texts.dart';

class Splash1 extends StatelessWidget {
  const Splash1({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.onboarding);
    });

    return Scaffold(
      //backgroundColor: Colors.indigo[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Spacer(),

            Image.asset('assets/images/car.png', height: 140),

            const SizedBox(height: 24),

            CustomText(
              AppTexts.splashTitle,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            CustomText(AppTexts.splashSubtitle, style: Theme.of(context).textTheme.bodyMedium),

            const Spacer(),

            const SpinKitFadingCircle(
              color: Color(0xFF1B6EF7),
              size: 40.0,
            ),

            const SizedBox(height: 24),
          ],
        )
      ),
    );
  }
}

