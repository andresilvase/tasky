import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';
import 'package:tasky/core/utils/storage_permission.dart';
import 'package:test/test.dart';

import '../../../mocks/permission_handler.dart';

void main() {
  late DevicePermission devicePermission;

  setUp(() {
    PermissionHandlerPlatform.instance = MockPermissionHandlerPlatform();
    devicePermission = DevicePermission(Permission.camera, Permission.photos);
  });

  group('DevicePermission', () {
    test('should request access to camera', () async {
      expect(
        await devicePermission.requestCameraPermission(),
        isA<PermissionStatus>(),
      );
    });

    test('should request access to galery', () async {
      expect(
        await devicePermission.requestGaleryPermission(),
        isA<PermissionStatus>(),
      );
    });
  });
}
