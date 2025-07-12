import 'package:get/get.dart';
import '../model/language_model.dart';

class LanguageController extends GetxController {
  final selectedIndex = (-1).obs;

  final languages = [
    LanguageModel(name: "English (US)", flag: "assets/images/us.png"),
    LanguageModel(name: "Indonesia", flag: "assets/images/indo.png"),
    LanguageModel(name: "Afghanistan", flag: "assets/images/af.png"),
    LanguageModel(name: "Algeria", flag: "assets/images/alg.png"),
    LanguageModel(name: "Malaysia", flag: "assets/images/maly.png"),
    LanguageModel(name: "Arabic", flag: "assets/images/img_6.png"),
  ];

  void selectLanguage(int index) {
    selectedIndex.value = index;
  }

  bool get isLanguageSelected => selectedIndex.value != -1;
}
