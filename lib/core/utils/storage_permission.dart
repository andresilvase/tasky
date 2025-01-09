import 'package:permission_handler/permission_handler.dart';

class DevicePermission {
  final Permission _cameraPermission;
  final Permission _galeryPermission;

  DevicePermission([
    Permission? cameraPermission,
    Permission? galeryPermission,
  ])  : _cameraPermission = cameraPermission ?? Permission.camera,
        _galeryPermission = galeryPermission ?? Permission.photos;

  Future<PermissionStatus> requestGaleryPermission() {
    return _galeryPermission.request();
  }

  Future<PermissionStatus> requestCameraPermission() {
    return _cameraPermission.request();
  }
}
