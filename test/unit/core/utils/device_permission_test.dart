import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';
import 'package:tasky/core/utils/device_permission.dart';
import 'package:test/test.dart';

import '../../../mocks/permission_handler.dart';

void main() {
  late DevicePermission devicePermission;

  setUp(() {
    PermissionHandlerPlatform.instance = MockPermissionHandlerPlatform();

    devicePermission = DevicePermission(
      cameraPermission: Permission.camera,
      galeryPermission: Permission.photos,
    );
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
