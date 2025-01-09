import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:mockito/mockito.dart';

class MockPermissionHandlerPlatform extends Mock with MockPlatformInterfaceMixin implements PermissionHandlerPlatform {
  @override
  Future<PermissionStatus> checkPermissionStatus(Permission permission) => Future.value(PermissionStatus.granted);

  @override
  Future<ServiceStatus> checkServiceStatus(Permission permission) => Future.value(ServiceStatus.enabled);

  @override
  Future<bool> openAppSettings() => Future.value(true);

  @override
  Future<Map<Permission, PermissionStatus>> requestPermissions(List<Permission> permissions) {
    var permissionsMap = <Permission, PermissionStatus>{};
    return Future.value(permissionsMap);
  }

  @override
  Future<bool> shouldShowRequestPermissionRationale(Permission? permission) {
    return super.noSuchMethod(
      Invocation.method(
        #shouldShowPermissionRationale,
        [permission],
      ),
      returnValue: Future.value(true),
    );
  }
}
