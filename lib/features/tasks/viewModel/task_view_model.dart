import 'package:tasky/features/tasks/repository/task_repository.dart';
import 'package:tasky/features/auth/viewModel/auth_view_model.dart';
import 'package:tasky/features/tasks/model/task.dart';
import 'package:tasky/core/utils/extensions.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';
import 'dart:async';

class TaskViewModel extends GetxController {
  TaskViewModel(this._taskRepository);

  final AuthViewModel authViewModel = Get.find();

  final RxList<Task> _tasks = RxList<Task>();
  final RxString _queryString = ''.obs;
  TaskRepository _taskRepository;

  @override
  void onInit() {
    super.onInit();

    ever(authViewModel.activeUser, (value) {
      _taskRepository = TaskRepository(_taskRepository.db, authViewModel.activeUser.value.username);
      getAllTasks();
    });
  }

  Future<void> getAllTasks() async {
    _tasks(await _taskRepository.getTasks());
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
    await _taskRepository.addTask(task);
    await getAllTasks();
  }

  Future deleteTask(Task task) async {
    await _taskRepository.deleteTask(task);
    await getAllTasks();
  }

  Future deleteCompletedTasks() async {
    await _taskRepository.deleteCompletedTasks();
    await getAllTasks();
  }

  Future changeTaskStatus(Task task) async {
    await _taskRepository.updateTask(task.copyWith(isCompleted: !task.isCompleted));
    await getAllTasks();
  }

  Future deleteAllTasks() async {
    await _taskRepository.deleteAll();
    await getAllTasks();
  }
}
