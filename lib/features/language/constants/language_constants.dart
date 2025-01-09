import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taski/core/constants/widgets_keys.dart';
import 'package:get/get.dart';

class LanguageConstants {
  static final List<String> countries = ['US', 'BR', 'ES', 'FR', 'IT', 'IN', 'CN'];
  static final List<String> locales = ['en', 'pt', 'es', 'fr', 'it', 'hi', 'zh'];

  static final List<String> languages = [
    AppLocalizations.of(Get.context!)!.english,
    AppLocalizations.of(Get.context!)!.portuguese,
    AppLocalizations.of(Get.context!)!.spanish,
    AppLocalizations.of(Get.context!)!.french,
    AppLocalizations.of(Get.context!)!.italian,
    AppLocalizations.of(Get.context!)!.indian,
    AppLocalizations.of(Get.context!)!.chinese,
  ];

  static final List<String> languageItemKeys = [
    WidgetKeys.englishLanguage,
    WidgetKeys.portugueseLanguage,
    WidgetKeys.spanishLanguage,
    WidgetKeys.frenchLanguage,
    WidgetKeys.italianLanguage,
    WidgetKeys.indianLanguage,
    WidgetKeys.chineseLanguage,
  ];
}
