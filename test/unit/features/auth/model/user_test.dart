import 'package:flutter/material.dart';
import 'package:tasky/features/auth/model/user.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixtures.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('User', () {
    test('should create a user', () {
      final user = User(
        displayName: 'John Doe',
        username: 'john.doe',
        password: 'password',
        photoPath: 'photo.jpg',
      );
      expect(user.displayName, 'John Doe');
      expect(user.username, 'john.doe');
      expect(user.password, 'password');
      expect(user.photoPath, 'photo.jpg');
    });

    test('should create a User instance from a map', () {
      final user = User.fromMap(defaultUserMap);
      expect(user, isNotNull);
    });

    test('should create a map from a User instance', () {
      final user = User.fromMap(defaultUserMap);
      final map = user.toMap();
      expect(map, isNotNull);
    });

    test('should create a User instance from a existing one', () {
      final user = User.fromMap(defaultUserMap);
      final newUser = user.copyWith(
        displayName: 'Jane Doe',
        username: 'jane.doe',
        password: 'password',
        photoPath: 'photo.jpg',
      );
      expect(newUser.displayName, 'Jane Doe');
      expect(newUser.username, 'jane.doe');
      expect(newUser.password, 'password');
      expect(newUser.photoPath, 'photo.jpg');
    });

    test('should have the same hashCode', () {
      final user = User.fromMap(defaultUserMap);
      final user2 = User.fromMap(defaultUserMap);
      expect(user.hashCode, equals(user2.hashCode));
    });
  });
}
