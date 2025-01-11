import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';
import 'package:tasky/core/constants/assets.dart';
import 'package:tasky/core/utils/asset_picker.dart';
import 'package:tasky/core/utils/device_permission.dart';
import '../../../../test/mocks/image_picker.dart';
import '../../../../test/mocks/permission_handler.dart';
import '../../common/init_app.dart';
import 'update_display_name_test.dart';
import 'update_photo_profile.dart';

void main() {
  late MockPermissionHandlerPlatform permissionHandlerPlatformMock;
  late MockImagePickerPlatformMock imagePickerPlatformMock;
  late ImagePicker picker;

  setUp(() async {
    permissionHandlerPlatformMock = MockPermissionHandlerPlatform();
    PermissionHandlerPlatform.instance = permissionHandlerPlatformMock;

    imagePickerPlatformMock = MockImagePickerPlatformMock();
    ImagePickerPlatform.instance = imagePickerPlatformMock;
    picker = ImagePicker();

    Get.put<DevicePermission>(
      DevicePermission(
        cameraPermission: Permission.camera,
        galeryPermission: Permission.photos,
      ),
    );

    Get.put(AssetPicker(picker));

    when(imagePickerPlatformMock.getImageFromSource(source: anyNamed('source'), options: anyNamed('options')))
        .thenAnswer((Invocation _) async => XFile(TaskiAssets.mockedProfilePhoto));
  });

  group('profile tests should', () {
    testWidgets('update user photo and display name', (tester) async {
      await initApp(tester);
      await Future.delayed(const Duration(seconds: 2));

      await updatePhotoProfile(tester);
      await updateUserDisplayName(tester);
      await Future.delayed(const Duration(seconds: 2));
    });
  });
}
