import 'package:taski/features/tasks/repository/task_repository.dart';
import 'package:taski/features/tasks/viewModel/task_view_model.dart';
import 'package:taski/features/home/home_controller.dart';
import 'package:taski/core/db/hive/hive.dart';
import 'package:get/get.dart';

class TaskiBindings implements Bindings {
  TaskiBindings();

  @override
  void dependencies() {
    Get.lazyPut(() => TaskRepository(HiveDB.init(name: 'tasks')));
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => TaskViewModel(Get.find()));
  }
}
