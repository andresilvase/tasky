import 'package:taski/features/tasks/repository/task_repository.dart';
import 'package:taski/features/tasks/model/task.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';

class TaskViewModel extends GetxController {
  TaskViewModel(this.taskRepository);

  final TaskRepository taskRepository;

  List<Task> tasks = [];

  void getTasks() async {
    tasks = await taskRepository.getTasks();
  }

  void addTask(Task task) async {
    final uuid = Uuid().v4();
    task = task.copyWith(id: uuid);
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
