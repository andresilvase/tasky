import 'package:taski/features/language/repository/language_repository.dart';
import 'package:taski/features/language/model/locale.dart';
import 'package:get/get.dart';
import 'dart:ui';

class LanguageViewModel extends GetxController {
  LanguageViewModel(this.repository);

  final Rx<Locale> _locale = Locale('en', 'US').obs;

  final LanguageRepository repository;

  Locale get locale => _locale.value;

  Future<void> getLocale() async {
    final locale = await repository.getLocale();
    _locale.value = Locale(locale.languageCode);
  }

  void changeLocale(String countryCode) {
    _locale.value = Locale(countryCode);
    Get.updateLocale(_locale.value);
    repository.saveLocale(
      LocaleModel(languageCode: locale.languageCode),
    );
  }
}
