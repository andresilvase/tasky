import 'package:taski/core/utils/extensions.dart';

class AuthValidators {
  static String? usernameInputValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }

    value = value.removeAccents();

    if (value.length < 5) {
      return 'Username must be at least 5 characters';
    }

    if (value.length > 16) {
      return 'Username must be less than 16 characters';
    }

    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      return 'Username must be alphanumeric';
    }

    return null;
  }

  static String? passwordInputValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  static String? repeatPasswordInputValidator(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Repeat password is required';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }
}
