import 'package:tasky/features/home/home_controller.dart';
import 'package:get/get.dart';

class TaskyBindings implements Bindings {
  TaskyBindings();

  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
