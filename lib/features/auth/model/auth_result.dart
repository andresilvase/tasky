import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class AuthResult {
  AuthResult({required this.message, required this.ok});

  final String message;
  final bool ok;

  factory AuthResult.successfulRegistration() {
    return AuthResult(
      message: Get.context != null ? AppLocalizations.of(Get.context!)!.registrationSuccessful : '',
      ok: true,
    );
  }

  factory AuthResult.successfulLogin() {
    return AuthResult(
      message: Get.context != null ? AppLocalizations.of(Get.context!)!.loginSuccessful : '',
      ok: true,
    );
  }

  factory AuthResult.registrationFailed() {
    return AuthResult(
      message: Get.context != null ? AppLocalizations.of(Get.context!)!.registrationFailed : '',
      ok: false,
    );
  }

  factory AuthResult.wrongPassword() {
    return AuthResult(
      message: Get.context != null ? AppLocalizations.of(Get.context!)!.wrongPassword : '',
      ok: false,
    );
  }

  factory AuthResult.userNotFound() {
    return AuthResult(
      message: Get.context != null ? AppLocalizations.of(Get.context!)!.userNotFound : '',
      ok: false,
    );
  }
}
