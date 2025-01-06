import 'dart:ui';

import 'package:get/get.dart';

class HomeController extends GetxController {
  final Rx<Locale> _locale = Locale('en', 'US').obs;
  final RxInt _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;
  Locale get locale => _locale.value;

  void changeIndex(int index) {
    _currentIndex.value = index;
  }

  void backToHome() {
    changeIndex(0);
  }

  void changeLocale(String locale) {
    _locale.value = Locale(locale);
    Get.updateLocale(_locale.value);
  }
}
