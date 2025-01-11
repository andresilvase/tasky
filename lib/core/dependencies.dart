import 'package:tasky/features/language/repository/language_repository.dart';
import 'package:tasky/features/language/viewModel/language_view_model.dart';
import 'package:tasky/features/tasks/repository/task_repository.dart';
import 'package:tasky/features/auth/respository/auth_repository.dart';
import 'package:tasky/features/tasks/viewModel/task_view_model.dart';
import 'package:tasky/features/auth/viewModel/auth_view_model.dart';
import 'package:tasky/core/utils/device_permission.dart';
import 'package:tasky/features/home/controller.dart';
import 'package:tasky/core/db/hive/hive_boxes.dart';
import 'package:tasky/core/utils/asset_picker.dart';
import 'package:tasky/core/theme/controller.dart';
import 'package:tasky/core/db/hive/hive.dart';
import 'package:get/get.dart';

class TaskiDependencies {
  static Future<void> _initDatabase() async {
    await HiveDB.instance.openBoxes([
      HiveBoxes.locale,
      HiveBoxes.activeUser,
      HiveBoxes.auth,
      HiveBoxes.defaulTaskStorage,
    ]);
  }

  static Future _initThemeDependencies() async {
    Get.lazyPut(() => ThemeController());
  }

  static Future _initAuthDependencies() async {
    Get.lazyPut(() => AuthRepository(HiveDB.instance));
    Get.lazyPut(() => AuthViewModel(Get.find()));
    await Get.find<AuthViewModel>().initSession();
  }

  static Future _initLanguageDependencies() async {
    Get.lazyPut(() => LanguageRepository(HiveDB.instance));
    Get.lazyPut(() => LanguageViewModel(Get.find()));
    await Get.find<LanguageViewModel>().getLocale();
  }

  static Future _initHomeDependencies() async {
    Get.lazyPut(() => HomeController());
  }

  static Future _initStoragePermissionDependencies() async {
    Get.lazyPut(() => DevicePermission());
    Get.lazyPut(() => AssetPicker());
  }

  static Future _initTaskDependencies() async {
    Get.lazyPut(() => TaskRepository(HiveDB.instance, Get.find<AuthViewModel>().activeUser.value.username));
    await Get.putAsync(() async => TaskViewModel(Get.find()));
    await Get.find<TaskViewModel>().getAllTasks();
  }

  static Future<void> init() async {
    await _initDatabase();

    await _initThemeDependencies();
    await _initLanguageDependencies();
    await _initAuthDependencies();
    await _initHomeDependencies();
    await _initTaskDependencies();
    await _initStoragePermissionDependencies();
  }
}
