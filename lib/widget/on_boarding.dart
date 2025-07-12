import 'package:flutter/material.dart';
import 'button.dart';

class OnboardingPage extends StatelessWidget {
  final String title, description, buttonText;
  final VoidCallback onButtonPressed;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.school, size: 100, color: Colors.blue),
          const SizedBox(height: 30),
          Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          const SizedBox(height: 10),
          Text(description, textAlign: TextAlign.center),
          const SizedBox(height: 40),
          CustomButton(text: buttonText, onPressed: onButtonPressed),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sm_assignment1/widget/texts.dart';
// import 'button.dart';
//
// class OnboardingScreen extends StatelessWidget {
//   final String imagePath;
//   final String title;
//   final String subtitle;
//   final String buttonText;
//   final VoidCallback onNext;
//
//   const OnboardingScreen({
//     super.key,
//     required this.imagePath,
//     required this.title,
//     required this.subtitle,
//     required this.buttonText,
//     required this.onNext,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(imagePath, height: 200),
//               const SizedBox(height: 24),
//               CustomText(
//                 title,
//                 style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 12),
//               CustomText(
//                 subtitle,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               const Spacer(),
//               CustomButton(
//                 label: buttonText,
//                  onTap: onNext,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
