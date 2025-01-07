import 'package:taski/features/auth/respository/auth_repository.dart';
import 'package:taski/features/tasks/repository/task_repository.dart';
import 'package:taski/features/home/repository/home_repository.dart';
import 'package:taski/features/tasks/viewModel/task_view_model.dart';
import 'package:taski/features/home/viewModel/home_view_model.dart';
import 'package:taski/features/auth/viewModel/auth_view_model.dart';
import 'package:taski/core/db/hive/hive_boxes.dart';
import 'package:taski/core/db/hive/hive.dart';
import 'package:get/get.dart';

class TaskiDependencies {
  static Future<void> _initDatabase() async {
    await HiveDB.instance.openBoxes([
      HiveBoxes.locale,
      HiveBoxes.activeUser,
      HiveBoxes.auth,
      HiveBoxes.defaulT,
    ]);
  }

  static Future _initAuthDependencies() async {
    Get.lazyPut(() => AuthRepository(HiveDB.instance));
    Get.lazyPut(() => AuthViewModel(Get.find()));
    await Get.find<AuthViewModel>().init();
  }

  static Future _initHomeDependencies() async {
    Get.lazyPut(() => HomeRepository(HiveDB.instance));
    Get.lazyPut(() => HomeViewModel(Get.find()));
    await Get.find<HomeViewModel>().getLocale();
  }

  static Future _initTaskDependencies() async {
    Get.lazyPut(() => TaskRepository(HiveDB.instance));
    await Get.putAsync(() async => TaskViewModel(Get.find()));
    await Get.find<TaskViewModel>().getAllTasks();
  }

  static Future<void> init() async {
    await _initDatabase();

    await _initAuthDependencies();
    await _initHomeDependencies();
    await _initTaskDependencies();
  }
}
