import 'package:tasky/features/tasks/model/task.dart';

class TaskRepository {
  Future<List<Task>> getTasks() async {
    return [];
  }

  Future<void> addTask(Task task) async {}

  Future<void> deleteTask(Task task) async {}

  Future<void> completeTask(Task task) async {}

  Future<void> uncompleteTask(Task task) async {}
}
