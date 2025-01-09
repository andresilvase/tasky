import 'package:permission_handler/permission_handler.dart';

class StoragePermission {
  Future<PermissionStatus> requestGaleryPermission() {
    return Permission.photos.request();
  }

  Future<PermissionStatus> requestCameraPermission() {
    return Permission.camera.request();
  }
}
