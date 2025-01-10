import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tasky/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class AuthValidators {
  AuthValidators(this.context);

  final BuildContext context;

  String? usernameInputValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.usernameRequired;
    }

    value = value.removeAccents();

    if (value.length < 5) {
      return AppLocalizations.of(context)!.usernameMinLength(5);
    }

    if (value.length > 16) {
      return AppLocalizations.of(context)!.usernameMaxLength(16);
    }

    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      return AppLocalizations.of(context)!.usernameMustBeAlphanumeric;
    }

    return null;
  }

  String? passwordInputValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.passwordRequired;
    }

    if (value.length < 4) {
      return AppLocalizations.of(context)!.passwordMinLength(4);
    }
    return null;
  }

  String? repeatPasswordInputValidator(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.repeatPasswordRequired;
    }

    if (value != password) {
      return AppLocalizations.of(context)!.passwordsMustMatch;
    }

    return null;
  }
}
