import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

final List<String> countries = ['US', 'BR', 'ES', 'FR', 'IT'];
final List<String> locales = ['en', 'pt', 'es', 'fr', 'it'];

final List<String> languages = [
  AppLocalizations.of(Get.context!)!.english,
  AppLocalizations.of(Get.context!)!.portuguese,
  AppLocalizations.of(Get.context!)!.spanish,
  AppLocalizations.of(Get.context!)!.french,
  AppLocalizations.of(Get.context!)!.italian,
];
