import 'package:taski/core/db/abstract_db.dart';
import 'package:taski/features/tasks/repository/task_repository.dart';
import 'package:taski/features/tasks/viewModel/task_view_model.dart';
import 'package:taski/features/home/home_controller.dart';
import 'package:taski/core/db/hive/hive.dart';
import 'package:get/get.dart';

final String _username = 'default';

class TaskiBindings {
  Future<void> init() async {
    await Get.putAsync(() async {
      final hiveInstance = HiveDB.init(name: _username);
      await hiveInstance.openBox(_username);
      return hiveInstance as Database;
    }).then((database) {
      Get.lazyPut(() => HomeController());
      Get.lazyPut(() => TaskRepository(database, _username));
      Get.lazyPut(() => TaskViewModel(Get.find()));
    });
  }
}
