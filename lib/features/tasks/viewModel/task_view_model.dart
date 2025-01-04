import 'package:tasky/features/tasks/repository/task_repository.dart';
import 'package:tasky/features/tasks/model/task.dart';
import 'package:get/get.dart';

class TaskViewModel extends GetxController {
  final TaskRepository taskRepository = TaskRepository();

  List<Task> tasks = [];

  void getTasks() async {
    tasks = await taskRepository.getTasks();
  }

  void addTask(Task task) async {
    await taskRepository.addTask(task);
    getTasks();
  }

  void deleteTask(Task task) async {
    await taskRepository.deleteTask(task);
    getTasks();
  }

  void completeTask(Task task) async {
    await taskRepository.completeTask(task);
    getTasks();
  }

  void uncompleteTask(Task task) async {
    await taskRepository.uncompleteTask(task);
    getTasks();
  }
}
