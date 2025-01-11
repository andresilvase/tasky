import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:tasky/features/auth/respository/auth_repository.dart';
import 'package:tasky/features/auth/viewModel/auth_view_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/mockito.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tasky/core/constants/widgets_keys.dart';
import 'package:tasky/core/utils/asset_picker.dart';
import 'package:tasky/core/utils/device_permission.dart';
import 'package:tasky/features/auth/views/profile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../../../mocks/image_picker.dart';
import '../../../mocks/mocks.mocks.dart';
import '../../../unit/fixtures/fixtures.dart';
import '../../common/app_wrapper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockImagePickerPlatformMock imagePickerPlatformMock;
  late MockDevicePermission mockDevicePermission;
  late AuthRepository authRepository;
  late AuthViewModel authViewModel;
  late String assetTestPath;
  late ImagePicker picker;
  late MockDatabase db;

  group('ImagePicker', () {
    setUp(() async {
      db = MockDatabase();
      authRepository = AuthRepository(db);
      authViewModel = AuthViewModel(authRepository);
      mockDevicePermission = MockDevicePermission();
      assetTestPath = 'path/to/test/image';

      imagePickerPlatformMock = MockImagePickerPlatformMock();
      ImagePickerPlatform.instance = imagePickerPlatformMock;

      picker = ImagePicker();

      Get.put(authViewModel);
      Get.put<DevicePermission>(mockDevicePermission);
      Get.put(AssetPicker(picker));

      when(imagePickerPlatformMock.getImageFromSource(source: anyNamed('source'), options: anyNamed('options')))
          .thenAnswer((Invocation _) async => null);
    });

    testWidgets('should display asset source selection popup', (WidgetTester tester) async {
      await tester.pumpWidget(AppWrapper(child: const Profile()));

      final profileImage = find.byKey(Key(WidgetKeys.profileImage));
      await tester.tap(profileImage);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
    });

    testWidgets('should select camera option', (WidgetTester tester) async {
      when(picker.pickImage(source: ImageSource.camera)).thenAnswer((_) async => XFile(assetTestPath));
      when(mockDevicePermission.requestCameraPermission()).thenAnswer((_) async => PermissionStatus.granted);
      await tester.pumpWidget(AppWrapper(child: const Profile()));

      final profileImage = find.byKey(Key(WidgetKeys.profileImage));
      await tester.tap(profileImage);
      await tester.pumpAndSettle();

      final selectAssetFromCamera = find.byKey(Key(WidgetKeys.pickAssetFromCamera));
      await tester.tap(selectAssetFromCamera);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);

      verify(imagePickerPlatformMock.getImageFromSource(
        source: ImageSource.camera,
        options: argThat(
          isInstanceOf<ImagePickerOptions>(),
          named: 'options',
        ),
      )).called(1);
    });

    testWidgets('should select galery option', (WidgetTester tester) async {
      when(picker.pickImage(source: ImageSource.gallery)).thenAnswer((_) async => XFile(assetTestPath));
      when(mockDevicePermission.requestGaleryPermission()).thenAnswer((_) async => PermissionStatus.granted);

      await tester.pumpWidget(AppWrapper(child: const Profile()));

      final profileImage = find.byKey(Key(WidgetKeys.profileImage));
      await tester.tap(profileImage);
      await tester.pumpAndSettle();

      final selectAssetFromGalery = find.byKey(Key(WidgetKeys.pickAssetFromGalery));
      await tester.tap(selectAssetFromGalery);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
      verify(imagePickerPlatformMock.getImageFromSource(
        source: ImageSource.gallery,
        options: argThat(
          isInstanceOf<ImagePickerOptions>(),
          named: 'options',
        ),
      )).called(1);
    });

    testWidgets('should select asset camera', (WidgetTester tester) async {
      when(mockDevicePermission.requestCameraPermission()).thenAnswer((_) async => PermissionStatus.granted);
      when(picker.pickImage(source: ImageSource.camera)).thenAnswer((_) async => XFile(assetTestPath));

      await tester.pumpWidget(AppWrapper(child: const Profile()));

      final profileImage = find.byKey(Key(WidgetKeys.profileImage));
      await tester.tap(profileImage);
      await tester.pumpAndSettle();

      final selectAssetFromCamera = find.byKey(Key(WidgetKeys.pickAssetFromCamera));
      await tester.tap(selectAssetFromCamera);
      await tester.pumpAndSettle();

      verify(mockDevicePermission.requestCameraPermission()).called(1);
      verify(imagePickerPlatformMock.getImageFromSource(
        source: ImageSource.camera,
        options: argThat(
          isInstanceOf<ImagePickerOptions>(),
          named: 'options',
        ),
      )).called(1);
    });

    testWidgets('should select asset galery', (WidgetTester tester) async {
      when(mockDevicePermission.requestGaleryPermission()).thenAnswer((_) async => PermissionStatus.granted);
      when(picker.pickImage(source: ImageSource.gallery)).thenAnswer((_) async => XFile(assetTestPath));

      await tester.pumpWidget(AppWrapper(child: const Profile()));

      final profileImage = find.byKey(Key(WidgetKeys.profileImage));
      await tester.tap(profileImage);
      await tester.pumpAndSettle();

      final selectAssetFromGalery = find.byKey(Key(WidgetKeys.pickAssetFromGalery));
      await tester.tap(selectAssetFromGalery);
      await tester.pumpAndSettle();

      verify(mockDevicePermission.requestGaleryPermission()).called(1);
      verify(imagePickerPlatformMock.getImageFromSource(
        source: ImageSource.gallery,
        options: argThat(
          isInstanceOf<ImagePickerOptions>(),
          named: 'options',
        ),
      )).called(1);
    });

    testWidgets('should update user profile when file path returned is NOT null', (WidgetTester tester) async {
      when(mockDevicePermission.requestCameraPermission()).thenAnswer((_) async => PermissionStatus.granted);
      when(imagePickerPlatformMock.getImageFromSource(source: ImageSource.camera, options: anyNamed('options')))
          .thenAnswer((_) async => XFile(assetTestPath));

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

      verify(imagePickerPlatformMock.getImageFromSource(
        source: ImageSource.camera,
        options: argThat(
          isInstanceOf<ImagePickerOptions>(),
          named: 'options',
        ),
      )).called(1);

      verify(mockDevicePermission.requestCameraPermission()).called(1);
      expect(authViewModel.activeUser.value.photoPath, isNotNull);
    });

    testWidgets('should NOT update user profile when file path returned is null', (WidgetTester tester) async {
      when(mockDevicePermission.requestCameraPermission()).thenAnswer((_) async => PermissionStatus.granted);
      when(picker.pickImage(source: ImageSource.camera)).thenAnswer((_) async => null);

      await tester.pumpWidget(AppWrapper(child: const Profile()));

      final profileImage = find.byKey(Key(WidgetKeys.profileImage));
      await tester.tap(profileImage);
      await tester.pumpAndSettle();

      final selectAssetFromCamera = find.byKey(Key(WidgetKeys.pickAssetFromCamera));
      await tester.tap(selectAssetFromCamera);
      await tester.pumpAndSettle();

      verify(imagePickerPlatformMock.getImageFromSource(
        source: ImageSource.camera,
        options: argThat(
          isInstanceOf<ImagePickerOptions>(),
          named: 'options',
        ),
      )).called(1);
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
