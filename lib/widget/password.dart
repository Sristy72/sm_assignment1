import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import 'text_field.dart';

class Password extends StatelessWidget {
  final RxBool visibility;
  final TextEditingController textController;
  final String hint;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  const Password({
    super.key,
    required this.visibility,
    required this.textController,
    required this.hint,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomTextField(
      controller: textController,
      hint: hint,
      validator: validator,
      obscure: !visibility.value,
      onChanged: onChanged,
      suffixIcon: IconButton(
        icon: Icon(
          visibility.value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: Colors.grey,
        ),
        onPressed: () => visibility.toggle(),
      ),
    ));
  }
}
