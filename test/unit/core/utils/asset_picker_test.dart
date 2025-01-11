import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:tasky/core/utils/asset_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/image_picker.dart';

void main() {
  late MockImagePickerPlatformMock imagePickerPlatformMock;
  late AssetPicker assetPicker;
  late ImagePicker picker;

  setUp(() {
    imagePickerPlatformMock = MockImagePickerPlatformMock();
    ImagePickerPlatform.instance = imagePickerPlatformMock;

    picker = ImagePicker();
    assetPicker = AssetPicker(picker);

    when(imagePickerPlatformMock.getImageFromSource(source: anyNamed('source'), options: anyNamed('options')))
        .thenAnswer((Invocation _) async => null);
  });

  group('AssetPicker', () {
    test('pickImage should call ImagePicker.pickImage with camera source', () async {
      when(picker.pickImage(source: ImageSource.camera)).thenAnswer((_) async => XFile('test_image_path'));

      await assetPicker.pickImage(source: ImageSource.camera);

      verify(imagePickerPlatformMock.getImageFromSource(
        source: ImageSource.camera,
        options: argThat(
          isInstanceOf<ImagePickerOptions>(),
          named: 'options',
        ),
      )).called(1);
    });

    test('pickImage should call ImagePicker.pickImage with gallery source', () async {
      when(picker.pickImage(source: ImageSource.gallery)).thenAnswer((_) async => XFile('test_image_path'));

      await assetPicker.pickImage(source: ImageSource.gallery);

      verify(imagePickerPlatformMock.getImageFromSource(
        source: ImageSource.gallery,
        options: argThat(
          isInstanceOf<ImagePickerOptions>(),
          named: 'options',
        ),
      )).called(1);
    });

    test('pickImage should return null when ImagePicker returns null', () async {
      when(picker.pickImage(source: ImageSource.camera)).thenAnswer((_) async => null);

      final result = await assetPicker.pickImage(source: ImageSource.camera);

      expect(result, isNull);
    });

    test('pickImage should return XFile when ImagePicker succeeds', () async {
      final expectedFile = XFile('test_image_path');

      when(imagePickerPlatformMock.getImageFromSource(source: ImageSource.camera, options: anyNamed('options')))
          .thenAnswer((Invocation _) async => expectedFile);

      final result = await assetPicker.pickImage(source: ImageSource.camera);

      verify(imagePickerPlatformMock.getImageFromSource(
        source: ImageSource.camera,
        options: argThat(
          isInstanceOf<ImagePickerOptions>(),
          named: 'options',
        ),
      )).called(1);

      expect(result?.path, equals(expectedFile.path));
    });
  });
}
