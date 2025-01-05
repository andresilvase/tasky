import 'package:taski/features/tasks/repository/task_repository.dart';
import 'package:taski/features/tasks/viewModel/task_view_model.dart';
import 'package:taski/features/home/home_controller.dart';
import 'package:taski/core/db/hive/hive.dart';
import 'package:get/get.dart';

class TaskiBindings implements Bindings {
  TaskiBindings();

  @override
  void dependencies() {
    final String username = 'default';

    Get.lazyPut(() => HiveDB.init(name: username));
    Get.lazyPut(() => TaskRepository(Get.find(), username));
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => TaskViewModel(Get.find()));
  }
}
