import 'package:tasky/features/auth/respository/auth_repository.dart';
import '../../../../mocks/mocks.mocks.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../fixtures/fixtures.dart';

void main() {
  group('Auth Repository', () {
    WidgetsFlutterBinding.ensureInitialized();
    late AuthRepository repository;
    late MockDatabase db;

    setUp(() {
      db = MockDatabase();
      repository = AuthRepository(db);
    });

    test('should get an active user', () async {
      when(db.getAll('activeUser')).thenAnswer((_) async => [defaultUserMap]);
      final result = await repository.getActiveUser();
      expect(result, equals(defaultUser));
    });

    test('should update an active user', () async {
      when(db.insert('activeUser', defaultUserMap)).thenAnswer((_) async => 1);
      await repository.updateActiveUser(defaultUser);
      verify(db.insert('activeUser', defaultUserMap)).called(1);
    });

    test('should update an user account', () async {
      when(db.update('auth', defaultUserMap, defaultUser.username)).thenAnswer((_) async => 1);
      await repository.updateUserAccount(defaultUser);
      verify(db.update('auth', defaultUserMap, defaultUser.username)).called(1);
    });

    test('should register a new user', () async {
      when(db.get('auth', defaultUser.username)).thenAnswer((_) async => {});
      when(db.insert('auth', defaultUserMap)).thenAnswer((_) async => 1);
      final result = await repository.register(defaultUser);

      expect(result.ok, isTrue);
    });

    test('should fail when trying to register an existant username', () async {
      when(db.get('auth', defaultUser.username)).thenAnswer((_) async => defaultUserMap);

      final result = await repository.register(defaultUser);

      expect(result.ok, isFalse);
    });

    test('should fail registration when DB cannot save user', () async {
      when(db.get('auth', defaultUser.username)).thenAnswer((_) async => {});
      when(db.insert('auth', defaultUserMap)).thenAnswer((_) async => 0);

      final result = await repository.register(defaultUser);

      expect(result.ok, isFalse);
    });

    test('should login a valid user', () async {
      when(db.get('auth', defaultUser.username)).thenAnswer((_) async => defaultUserMap);
      when(db.update('activeUser', defaultUserMap, defaultUser.username)).thenAnswer((_) async => 1);

      final result = await repository.login(defaultUser);
      expect(result.ok, isTrue);
    });

    test('should NOT login a user with invalid credentials', () async {
      when(db.get('auth', defaultUser.username)).thenAnswer((_) async => defaultUserWithInvalidPassword.toMap());

      final result = await repository.login(defaultUser);
      expect(result.ok, isFalse);
    });

    test('should NOT login a not existent user', () async {
      when(db.get('auth', defaultUser.username)).thenAnswer((_) async => {});

      final result = await repository.login(defaultUser);
      expect(result.ok, isFalse);
    });

    test('should logout', () async {
      when(db.update('activeUser', {}, defaultUser.username)).thenAnswer((_) async => 1);
      when(db.clear('activeUser')).thenAnswer((_) async => 1);

      await repository.logout();

      when(db.getAll('activeUser')).thenAnswer((_) async => []);
      final result = await repository.getActiveUser();

      expect(result, isNull);
    });
  });
}
