import 'package:taski/features/tasks/repository/task_repository.dart';
import 'package:taski/features/tasks/model/task.dart';
import 'package:taski/core/utils/extensions.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';
import 'dart:async';

class TaskViewModel extends GetxController {
  TaskViewModel(this.taskRepository);

  final RxList<Task> _tasks = RxList<Task>();
  final RxString _queryString = ''.obs;
  final TaskRepository taskRepository;

  Future<void> getAllTasks() async {
    _tasks(await taskRepository.getTasks());
  }

  List<Task> get completedTasks => _tasks.where((task) => task.isCompleted).toList();
  List<Task> get todoTasks => _tasks.where((task) => !task.isCompleted).toList();

  void addSearchQuery(String query) {
    _queryString(query);
  }

  List<Task> get searchTasksResult {
    final queryString = _queryString.value;

    return _tasks.where((task) {
      final String? taskDescriptionLowerCase = task.description?.toLowerCase().trim().removeAccents();
      final String queryStringLowerCase = queryString.toLowerCase().trim().removeAccents();
      final String taskTitleLowerCase = task.title.toLowerCase().trim().removeAccents();

      final bool isTaskTitleMatch = taskTitleLowerCase.contains(queryStringLowerCase);
      final bool isTaskDescriptionMatch = taskDescriptionLowerCase?.contains(queryStringLowerCase) ?? false;

      return queryStringLowerCase.isNotEmpty && (isTaskTitleMatch || isTaskDescriptionMatch);
    }).toList();
  }

  Future addTask(Task task) async {
    final uuid = Uuid().v4();
    task = task.copyWith(id: uuid);
    await taskRepository.addTask(task);
    await getAllTasks();
  }

  Future deleteTask(Task task) async {
    await taskRepository.deleteTask(task);
    await getAllTasks();
  }

  Future deleteCompletedTasks() async {
    await taskRepository.deleteCompletedTasks();
    await getAllTasks();
  }

  Future changeTaskStatus(Task task) async {
    await taskRepository.updateTask(task.copyWith(isCompleted: !task.isCompleted));
    await getAllTasks();
  }

  Future deleteAllTasks() async {
    await taskRepository.deleteAll();
    await getAllTasks();
  }
}
