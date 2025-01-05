import 'package:taski/features/tasks/model/task.dart';
import 'package:taski/core/db/abstract_db.dart';

class TaskRepository {
  TaskRepository(this.db);

  final Database db;

  Future<List<Task>> getTasks() async {
    return [];
  }

  Future<void> addTask(Task task) async {}

  Future<void> deleteTask(Task task) async {}

  Future<void> completeTask(Task task) async {}

  Future<void> uncompleteTask(Task task) async {}
}
