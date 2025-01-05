import 'dart:async';

import 'package:taski/features/tasks/repository/task_repository.dart';
import 'package:taski/features/tasks/model/task.dart';
import 'package:taski/core/utils/extensions.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';

class TaskViewModel extends GetxController {
  TaskViewModel(this.taskRepository);

  final RxList<Task> _tasks = RxList<Task>();
  final RxString _queryString = ''.obs;
  final TaskRepository taskRepository;

  Future<void> getAllTasks() async {
    _tasks(await taskRepository.getTasks());
    _todoListStream.add(_tasks.where((task) => !task.isCompleted).toList());
  }

  final _todoListStream = StreamController<List<Task>>.broadcast();
  Stream<List<Task>> get todoListStream => _todoListStream.stream;

  Stream<List<Task>> getCompletedTasksStream() async* {
    await getAllTasks();
    yield _tasks.where((task) => task.isCompleted).toList();
  }

  void addSearchQuery(String query) {
    _queryString(query);
  }

  Stream<List<Task>> searchTasksResult() async* {
    await getAllTasks();
    final queryString = _queryString.value;

    yield _tasks.where((task) {
      final String? taskDescriptionLowerCase = task.description?.toLowerCase().trim().removeAccents();
      final String queryStringLowerCase = queryString.toLowerCase().trim().removeAccents();
      final String taskTitleLowerCase = task.title.toLowerCase().trim().removeAccents();

      final bool isTaskTitleMatch = taskTitleLowerCase.contains(queryStringLowerCase);
      final bool isTaskDescriptionMatch = taskDescriptionLowerCase?.contains(queryStringLowerCase) ?? false;

      return queryStringLowerCase.isNotEmpty && (isTaskTitleMatch || isTaskDescriptionMatch);
    }).toList();
  }

  int get uncompletedTasks => _tasks.where((task) => !task.isCompleted).length;
  int get completedTasks => _tasks.where((task) => task.isCompleted).length;

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

  Future completeTask(Task task) async {
    await taskRepository.updateTask(task.copyWith(isCompleted: true));
    await getAllTasks();
  }

  Future deleteAllTasks() async {
    await taskRepository.deleteAll();
    await getAllTasks();
  }
}
