import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt _currentIndex = 0.obs;
  final RxString _locale = 'en'.obs;

  int get currentIndex => _currentIndex.value;
  String get locale => _locale.value;

  void changeIndex(int index) {
    _currentIndex.value = index;
  }

  void backToHome() {
    changeIndex(0);
  }

  void changeLocale(String locale) {
    _locale(locale);
  }
}
