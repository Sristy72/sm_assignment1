import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/auth_controller.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() {
  Get.put(AuthController());
  runApp(const EdulineApp());
}

class EdulineApp extends StatelessWidget {
  const EdulineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF8F8F8)
      ),
      title: 'Eduline',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}
