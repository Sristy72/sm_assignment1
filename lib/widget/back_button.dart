import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_sharp, size: 26),
      onPressed: () => Get.back(),
      padding: EdgeInsets.zero, // remove internal padding
      constraints: const BoxConstraints(), // remove default sizing
      splashRadius: 20,
    );
  }
}