import 'package:taski/features/tasks/repository/task_repository.dart';
import 'package:taski/features/tasks/model/task.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';

class TaskViewModel extends GetxController {
  TaskViewModel(this.taskRepository);

  final RxList<Task> _tasks = RxList<Task>();
  final TaskRepository taskRepository;

  Future<void> getAllTasks() async {
    _tasks(await taskRepository.getTasks());
  }

  Stream<List<Task>> getTodoListStream() async* {
    await getAllTasks();
    yield _tasks.where((task) => !task.isCompleted).toList();
  }

  Stream<List<Task>> getCompletedTasksStream() async* {
    await getAllTasks();
    yield _tasks.where((task) => task.isCompleted).toList();
  }

  int get uncompletedTasks => _tasks.where((task) => !task.isCompleted).length;
  int get completedTasks => _tasks.where((task) => task.isCompleted).length;

  void addTask(Task task) async {
    final uuid = Uuid().v4();
    task = task.copyWith(id: uuid);
    await taskRepository.addTask(task);
    await getAllTasks();
  }

  void deleteTask(Task task) async {
    await taskRepository.deleteTask(task);
    await getAllTasks();
  }

  void completeTask(Task task) async {
    await taskRepository.updateTask(task);
    await getAllTasks();
  }

  void deleteAllTasks() async {
    await taskRepository.deleteAll();
    await getAllTasks();
  }
}
