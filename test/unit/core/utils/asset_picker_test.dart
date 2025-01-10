import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/mockito.dart';
import 'package:tasky/core/utils/asset_picker.dart';

import '../../../mocks/mocks.mocks.dart';

void main() {
  late MockImagePicker mockImagePicker;
  late AssetPicker assetPicker;

  setUp(() {
    mockImagePicker = MockImagePicker();
    assetPicker = AssetPicker(mockImagePicker);
  });

  group('AssetPicker', () {
    test('pickImage should call ImagePicker.pickImage with camera source', () async {
      when(mockImagePicker.pickImage(source: ImageSource.camera)).thenAnswer((_) async => XFile('test_image_path'));

      await assetPicker.pickImage(source: ImageSource.camera);

      verify(mockImagePicker.pickImage(source: ImageSource.camera)).called(1);
    });

    test('pickImage should call ImagePicker.pickImage with gallery source', () async {
      when(mockImagePicker.pickImage(source: ImageSource.gallery)).thenAnswer((_) async => XFile('test_image_path'));

      await assetPicker.pickImage(source: ImageSource.gallery);

      verify(mockImagePicker.pickImage(source: ImageSource.gallery)).called(1);
    });

    test('pickImage should return null when ImagePicker returns null', () async {
      when(mockImagePicker.pickImage(source: ImageSource.camera)).thenAnswer((_) async => null);

      final result = await assetPicker.pickImage(source: ImageSource.camera);

      expect(result, isNull);
    });

    test('pickImage should return XFile when ImagePicker succeeds', () async {
      final expectedFile = XFile('test_image_path');
      when(mockImagePicker.pickImage(source: ImageSource.camera)).thenAnswer((_) async => expectedFile);

      final result = await assetPicker.pickImage(source: ImageSource.camera);

      expect(result?.path, equals(expectedFile.path));
    });
  });
}
