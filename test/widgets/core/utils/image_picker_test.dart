import 'package:taski/features/auth/respository/auth_repository.dart';
import 'package:taski/features/auth/viewModel/auth_view_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/mockito.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taski/core/constants/widgets_keys.dart';
import 'package:taski/core/utils/asset_picker.dart';
import 'package:taski/core/utils/storage_permission.dart';
import 'package:taski/features/auth/views/profile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../../../mocks/mocks.mocks.dart';
import '../../../unit/fixtures/fixtures.dart';
import '../../common/app_wrapper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockDevicePermission mockDevicePermission;
  late MockAssetPicker mockAssetPicker;
  late AuthRepository authRepository;
  late AuthViewModel authViewModel;
  late String assetTestPath;
  late MockDatabase db;

  group('ImagePicker', () {
    setUp(() async {
      db = MockDatabase();
      authRepository = AuthRepository(db);
      authViewModel = AuthViewModel(authRepository);
      mockDevicePermission = MockDevicePermission();
      assetTestPath = 'path/to/test/image';
      mockAssetPicker = MockAssetPicker();

      Get.put(authViewModel);
      Get.put<DevicePermission>(mockDevicePermission);
      Get.put<AssetPicker>(mockAssetPicker);
    });

    testWidgets('should display asset source selection popup', (WidgetTester tester) async {
      await tester.pumpWidget(AppWrapper(child: const Profile()));

      final profileImage = find.byKey(Key(WidgetKeys.profileImage));
      await tester.tap(profileImage);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
    });

    testWidgets('should select camera option', (WidgetTester tester) async {
      when(mockDevicePermission.requestCameraPermission()).thenAnswer((_) async => PermissionStatus.granted);
      when(mockAssetPicker.pickImage(source: ImageSource.camera)).thenAnswer((_) async => XFile(assetTestPath));
      await tester.pumpWidget(AppWrapper(child: const Profile()));

      final profileImage = find.byKey(Key(WidgetKeys.profileImage));
      await tester.tap(profileImage);
      await tester.pumpAndSettle();

      final selectAssetFromCamera = find.byKey(Key(WidgetKeys.pickAssetFromCamera));
      await tester.tap(selectAssetFromCamera);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
      verify(mockAssetPicker.pickImage(source: ImageSource.camera)).called(1);
    });

    testWidgets('should select galery option', (WidgetTester tester) async {
      when(mockAssetPicker.pickImage(source: ImageSource.gallery)).thenAnswer((_) async => XFile(assetTestPath));
      when(mockDevicePermission.requestGaleryPermission()).thenAnswer((_) async => PermissionStatus.granted);

      await tester.pumpWidget(AppWrapper(child: const Profile()));

      final profileImage = find.byKey(Key(WidgetKeys.profileImage));
      await tester.tap(profileImage);
      await tester.pumpAndSettle();

      final selectAssetFromGalery = find.byKey(Key(WidgetKeys.pickAssetFromGalery));
      await tester.tap(selectAssetFromGalery);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
      verify(mockAssetPicker.pickImage(source: ImageSource.gallery)).called(1);
    });

    testWidgets('should select asset camera', (WidgetTester tester) async {
      when(mockDevicePermission.requestCameraPermission()).thenAnswer((_) async => PermissionStatus.granted);
      when(mockAssetPicker.pickImage(source: ImageSource.camera)).thenAnswer((_) async => XFile(assetTestPath));

      await tester.pumpWidget(AppWrapper(child: const Profile()));

      final profileImage = find.byKey(Key(WidgetKeys.profileImage));
      await tester.tap(profileImage);
      await tester.pumpAndSettle();

      final selectAssetFromCamera = find.byKey(Key(WidgetKeys.pickAssetFromCamera));
      await tester.tap(selectAssetFromCamera);
      await tester.pumpAndSettle();

      verify(mockDevicePermission.requestCameraPermission()).called(1);
      verify(mockAssetPicker.pickImage(source: ImageSource.camera)).called(1);
    });

    testWidgets('should select asset galery', (WidgetTester tester) async {
      when(mockDevicePermission.requestGaleryPermission()).thenAnswer((_) async => PermissionStatus.granted);
      when(mockAssetPicker.pickImage(source: ImageSource.gallery)).thenAnswer((_) async => XFile(assetTestPath));

      await tester.pumpWidget(AppWrapper(child: const Profile()));

      final profileImage = find.byKey(Key(WidgetKeys.profileImage));
      await tester.tap(profileImage);
      await tester.pumpAndSettle();

      final selectAssetFromGalery = find.byKey(Key(WidgetKeys.pickAssetFromGalery));
      await tester.tap(selectAssetFromGalery);
      await tester.pumpAndSettle();

      verify(mockDevicePermission.requestGaleryPermission()).called(1);
      verify(mockAssetPicker.pickImage(source: ImageSource.gallery)).called(1);
    });

    testWidgets('should update user profile when file path returned is NOT null', (WidgetTester tester) async {
      when(mockDevicePermission.requestCameraPermission()).thenAnswer((_) async => PermissionStatus.granted);
      when(mockAssetPicker.pickImage(source: ImageSource.camera)).thenAnswer((_) async => XFile(assetTestPath));

      when(
        db.insert(defaultUser.username, defaultUser.copyWith(photoPath: assetTestPath).toMap()),
      ).thenAnswer((_) async => 1);

      await tester.pumpWidget(AppWrapper(child: const Profile()));

      final profileImage = find.byKey(Key(WidgetKeys.profileImage));
      await tester.tap(profileImage);
      await tester.pumpAndSettle();

      final selectAssetFromCamera = find.byKey(Key(WidgetKeys.pickAssetFromCamera));
      await tester.tap(selectAssetFromCamera);
      await tester.pumpAndSettle();

      verify(mockAssetPicker.pickImage(source: ImageSource.camera)).called(1);
      verify(mockDevicePermission.requestCameraPermission()).called(1);
      expect(authViewModel.activeUser.value.photoPath, isNotNull);
    });

    testWidgets('should NOT update user profile when file path returned is null', (WidgetTester tester) async {
      when(mockDevicePermission.requestCameraPermission()).thenAnswer((_) async => PermissionStatus.granted);
      when(mockAssetPicker.pickImage(source: ImageSource.camera)).thenAnswer((_) async => null);

      await tester.pumpWidget(AppWrapper(child: const Profile()));

      final profileImage = find.byKey(Key(WidgetKeys.profileImage));
      await tester.tap(profileImage);
      await tester.pumpAndSettle();

      final selectAssetFromCamera = find.byKey(Key(WidgetKeys.pickAssetFromCamera));
      await tester.tap(selectAssetFromCamera);
      await tester.pumpAndSettle();

      verify(mockAssetPicker.pickImage(source: ImageSource.camera)).called(1);
      verify(mockDevicePermission.requestCameraPermission()).called(1);
      expect(authViewModel.activeUser.value.photoPath, isNull);
    });

    testWidgets('should show request access pop when camera access is permanently denied', (WidgetTester tester) async {
      when(mockDevicePermission.requestCameraPermission()).thenAnswer((_) async => PermissionStatus.permanentlyDenied);

      await tester.pumpWidget(AppWrapper(child: const Profile()));

      final profileImage = find.byKey(Key(WidgetKeys.profileImage));
      await tester.tap(profileImage);
      await tester.pumpAndSettle();

      final selectAssetFromCamera = find.byKey(Key(WidgetKeys.pickAssetFromCamera));
      await tester.tap(selectAssetFromCamera);
      await tester.pumpAndSettle();

      verify(mockDevicePermission.requestCameraPermission()).called(1);

      final requestAccessPopup = find.byKey(Key(WidgetKeys.requestAccessPopup));
      expect(requestAccessPopup, findsOneWidget);
    });

    testWidgets('should show request access pop when galery access is permanently denied', (WidgetTester tester) async {
      when(mockDevicePermission.requestGaleryPermission()).thenAnswer((_) async => PermissionStatus.permanentlyDenied);

      await tester.pumpWidget(AppWrapper(child: const Profile()));

      final profileImage = find.byKey(Key(WidgetKeys.profileImage));
      await tester.tap(profileImage);
      await tester.pumpAndSettle();

      final selectAssetFromGalery = find.byKey(Key(WidgetKeys.pickAssetFromGalery));
      await tester.tap(selectAssetFromGalery);
      await tester.pumpAndSettle();

      verify(mockDevicePermission.requestGaleryPermission()).called(1);

      final requestAccessPopup = find.byKey(Key(WidgetKeys.requestAccessPopup));
      expect(requestAccessPopup, findsOneWidget);
    });

    testWidgets('should confirm access when popup is presented', (WidgetTester tester) async {
      when(mockDevicePermission.requestGaleryPermission()).thenAnswer((_) async => PermissionStatus.permanentlyDenied);

      await tester.pumpWidget(AppWrapper(child: const Profile()));

      final profileImage = find.byKey(Key(WidgetKeys.profileImage));
      await tester.tap(profileImage);
      await tester.pumpAndSettle();

      final selectAssetFromGalery = find.byKey(Key(WidgetKeys.pickAssetFromGalery));
      await tester.tap(selectAssetFromGalery);
      await tester.pumpAndSettle();

      verify(mockDevicePermission.requestGaleryPermission()).called(1);

      final requestAccessPopup = find.byKey(Key(WidgetKeys.requestAccessPopup));
      expect(requestAccessPopup, findsOneWidget);

      final confirmButton = find.byKey(Key(WidgetKeys.popUpMessageConfirm));
      await tester.tap(confirmButton);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
    });

    testWidgets('should deny request to access is presented', (WidgetTester tester) async {
      when(mockDevicePermission.requestGaleryPermission()).thenAnswer((_) async => PermissionStatus.permanentlyDenied);

      await tester.pumpWidget(AppWrapper(child: const Profile()));

      final profileImage = find.byKey(Key(WidgetKeys.profileImage));
      await tester.tap(profileImage);
      await tester.pumpAndSettle();

      final selectAssetFromGalery = find.byKey(Key(WidgetKeys.pickAssetFromGalery));
      await tester.tap(selectAssetFromGalery);
      await tester.pumpAndSettle();

      verify(mockDevicePermission.requestGaleryPermission()).called(1);

      final requestAccessPopup = find.byKey(Key(WidgetKeys.requestAccessPopup));
      expect(requestAccessPopup, findsOneWidget);

      final denyButton = find.byKey(Key(WidgetKeys.popUpMessageDeny));
      await tester.tap(denyButton);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
    });
  });

  tearDown(() {
    Get.reset();
  });
}
