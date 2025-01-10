import 'package:flutter/material.dart';
import 'package:tasky/features/auth/model/auth_result.dart';
import 'package:test/test.dart';

void main() {
  group('AuthResult', () {
    WidgetsFlutterBinding.ensureInitialized();
    test('should create a successful registration result', () {
      final result = AuthResult.successfulRegistration();

      expect(result.ok, true);
    });

    test('should create a successful login result', () {
      final result = AuthResult.successfulLogin();
      expect(result.ok, true);
    });

    test('should create a registration failed result', () {
      final result = AuthResult.registrationFailed();
      expect(result.ok, false);
    });

    test('should create a wrong password result', () {
      final result = AuthResult.wrongPassword();
      expect(result.ok, false);
    });

    test('should create a user not found result', () {
      final result = AuthResult.userNotFound();
      expect(result.ok, false);
    });
  });
}
