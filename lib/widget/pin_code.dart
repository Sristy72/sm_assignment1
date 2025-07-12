import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controller/auth_controller.dart';

class PinCode extends StatelessWidget {
  const PinCode({
    super.key,
    required this.controller,
  });

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      controller: controller.otpController,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      autoFocus: true,

      obscureText: true,
      obscuringCharacter: '●',
      textStyle: const TextStyle(
        color: Colors.black,       // ← dot (text) color
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),

      cursorColor: Colors.black,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(15),
        fieldHeight: 50,
        fieldWidth: 50,
        inactiveColor: Colors.grey.shade400,
        activeColor: Colors.grey.shade400,
        selectedColor: Colors.grey.shade400,
        activeFillColor: Colors.grey.shade200,
      ),
      animationDuration: const Duration(milliseconds: 300),
      onChanged: (value) {},
    );
  }
}