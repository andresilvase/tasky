import 'package:tasky/features/tasks/model/task.dart';
import 'package:tasky/core/db/abstract_db.dart';

class TaskRepository {
  TaskRepository(this.db, this.username);

  final String username;
  final Database db;

  Future<List<Task>> getTasks() async {
    final List<Map> maps = await db.getAll(username);

    return List.generate(maps.length, (index) {
      return Task.fromMap(maps[index]);
    });
  }

  Future<void> addTask(Task task) async {
    await db.insert(username, task.toMap());
  }

  Future<void> updateTask(Task task) async {
    await db.update(username, task.toMap(), task.id);
  }

  Future<void> deleteTask(Task task) async {
    await db.delete(username, task.id);
  }

  Future<void> deleteCompletedTasks() async {
    final List<Task> tasks = await getTasks();
    final List<Task> completedTasks = tasks.where((task) => task.isCompleted).toList();

    for (final task in completedTasks) {
      await deleteTask(task);
    }
  }

  Future<void> deleteAll() async {
    await db.clear(username);
  }
}
