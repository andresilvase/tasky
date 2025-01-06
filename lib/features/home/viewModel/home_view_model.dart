import 'package:taski/features/home/repository/home_repository.dart';
import 'package:taski/features/home/model/locale.dart';
import 'package:get/get.dart';
import 'dart:ui';

class HomeViewModel extends GetxController {
  HomeViewModel(this.repository);

  final Rx<Locale> _locale = Locale('en', 'US').obs;
  final RxInt _currentIndex = 0.obs;
  final HomeRepository repository;

  int get currentIndex => _currentIndex.value;
  Locale get locale => _locale.value;

  Future<void> getLocale() async {
    final locale = await repository.getLocale();
    _locale.value = Locale(locale.languageCode);
  }

  void changeIndex(int index) {
    _currentIndex.value = index;
  }

  void backToHome() {
    changeIndex(0);
  }

  void changeLocale(String countryCode) {
    _locale.value = Locale(countryCode);
    Get.updateLocale(_locale.value);
    repository.saveLocale(
      LocaleModel(languageCode: locale.languageCode),
    );
  }
}
