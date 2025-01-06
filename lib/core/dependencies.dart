import 'package:taski/features/home/repository/home_repository.dart';
import 'package:taski/features/tasks/repository/task_repository.dart';
import 'package:taski/features/tasks/viewModel/task_view_model.dart';
import 'package:taski/features/home/viewModel/home_view_model.dart';
import 'package:taski/core/db/abstract_db.dart';
import 'package:taski/core/db/hive/hive.dart';
import 'package:get/get.dart';

class TaskiDependencies {
  static Future<Database> _initDatabaseDependencies(String username) async {
    final String locale = 'locale';

    return await Get.putAsync(() async {
      await HiveDB.instance.openBoxes([username, locale]);
      return HiveDB.instance as Database;
    });
  }

  static Future _initHomeDependencies(String username, Database databaseInstance) async {
    Get.lazyPut(() => HomeRepository(databaseInstance));
    Get.lazyPut(() => HomeViewModel(Get.find()));
    await Get.find<HomeViewModel>().getLocale();
  }

  static Future _initTaskDependencies(String username, Database databaseInstance) async {
    Get.lazyPut(() => TaskRepository(databaseInstance, username));
    await Get.putAsync(() async => TaskViewModel(Get.find()));
    await Get.find<TaskViewModel>().getAllTasks();
  }

  static Future<void> init() async {
    final String username = 'default';

    final databaseInstance = await _initDatabaseDependencies(username);
    await _initHomeDependencies(username, databaseInstance);
    await _initTaskDependencies(username, databaseInstance);
  }
}
