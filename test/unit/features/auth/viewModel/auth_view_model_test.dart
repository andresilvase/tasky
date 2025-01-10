import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:taski/features/auth/respository/auth_repository.dart';
import 'package:taski/features/auth/viewModel/auth_view_model.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../mocks/fake_path_provider.dart';
import '../../../../mocks/file_builder.dart';
import '../../../fixtures/fixtures.dart';
import '../../../../mocks/mocks.mocks.dart';

void main() {
  group('Auth View Model', () {
    WidgetsFlutterBinding.ensureInitialized();

    late AuthRepository repository;
    late FileBuilder fileBuilder;
    late AuthViewModel viewModel;
    late MockDatabase db;

    late String destinationPath;
    late String photoPath;

    late MockFile mockSourceFile;
    late MockFile mockNewFile;

    setUp(() {
      db = MockDatabase();
      repository = AuthRepository(db);
      viewModel = AuthViewModel(repository);

      mockSourceFile = MockFile();
      mockNewFile = MockFile();
      photoPath = userPhotoPath;

      final String photoFileName = photoPath.split('/').last;

      destinationPath = '$fakeAppPath/$photoFileName';

      fileBuilder = FileBuilder(
        destinationPath: destinationPath,
        mockSourceFile: mockSourceFile,
        mockNewFile: mockNewFile,
        sourcePath: photoPath,
      );

      PathProviderPlatform.instance = FakePathProvider();
    });

    test('should change password visibility', () async {
      viewModel.setPasswordVisible();
      expect(viewModel.isPasswordVisible, true);
    });

    test('should toggle auth mode', () async {
      viewModel.toggleAuthMode();
      expect(viewModel.isLogin, false);
    });

    test('should set error', () async {
      viewModel.setErrorState(true);
      expect(viewModel.isInErrorState, true);
    });
    test('should set loading', () async {
      viewModel.setLoading(true);
      expect(viewModel.isLoading, true);
    });

    test('should update user photo profile', () async {
      final user = userWithPhoto.copyWith(photoPath: userUpdatePhotoPath);
      final userMap = user.toMap();

      when(db.update('auth', userMap, user.username)).thenAnswer((_) async => 1);
      when(db.insert('activeUser', userMap)).thenAnswer((_) async => 1);

      const byts = <int>[1, 2, 3];

      when(mockSourceFile.exists()).thenAnswer((_) async => true);
      when(mockSourceFile.readAsBytes()).thenAnswer((_) async => Uint8List.fromList(byts));
      when(mockNewFile.writeAsBytes(byts)).thenAnswer((_) async => mockNewFile);

      viewModel.updateUserPhoto(
        userPhotoPath,
        fileFactory: fileBuilder.fileFactory,
      );

      expect(viewModel.activeUser.value, userWithPhoto);
    });

    test('should update user display name', () async {
      when(db.insert('activeUser', userWithDisplayName.toMap())).thenAnswer((_) async => 1);
      when(db.update('auth', userWithDisplayName.toMap(), userWithDisplayName.username)).thenAnswer((_) async => 1);

      viewModel.updateUserDisplayName(userWithDisplayName.displayName);

      expect(viewModel.activeUser.value, userWithDisplayName);
    });

    test('should register a new user', () async {
      when(db.get('auth', userWithPasswordCiphered.username)).thenAnswer((_) async => {});
      when(db.insert('auth', userWithPasswordCiphered.toMap())).thenAnswer((_) async => 1);

      final result = await viewModel.register(userWithPassword.username, userWithPassword.password);
      expect(result.ok, isTrue);
    });

    test('should init session with a valid user', () async {
      when(db.getAll('activeUser')).thenAnswer((_) async => [defaultUserMap]);

      await viewModel.initSession();
      expect(viewModel.activeUser.value, defaultUser);
    });

    test('should login', () async {
      when(db.get('auth', userWithPasswordCiphered.username)).thenAnswer((_) async => userWithPasswordCiphered.toMap());
      when(db.getAll('activeUser')).thenAnswer((_) async => [userWithPasswordCiphered.toMap()]);
      when(
        db.update('activeUser', userWithPasswordCiphered.toMap(), userWithPasswordCiphered.username),
      ).thenAnswer((_) async => 1);

      final result = await viewModel.login(userWithPassword.username, userWithPassword.password);
      expect(result.ok, isTrue);
    });

    test('should logout', () async {
      when(db.update('activeUser', {}, defaultUser.username)).thenAnswer((_) async => 1);
      when(db.clear('activeUser')).thenAnswer((_) async => 1);

      await viewModel.logout();
      expect(viewModel.activeUser.value, defaultUser);
    });
  });
}
