import 'package:flutter/material.dart';

class textButton extends StatelessWidget {
  const textButton({
    super.key, required this.text, required this.onPressed, this.style
  });

  final String text;
  final VoidCallback onPressed;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child:  Text(text, style: style?? TextStyle(color: Colors.grey[600]),),
    );
  }
}