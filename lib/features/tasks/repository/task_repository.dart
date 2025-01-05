import 'package:taski/features/tasks/model/task.dart';
import 'package:taski/core/db/abstract_db.dart';

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

  Future<void> deleteTask(Task task) async {
    await db.delete(username, task.id);
  }

  Future<void> updateTask(Task task) async {
    await db.update(username, task.toMap(), task.id);
  }

  Future<void> deleteAll() async {
    await db.clear(username);
  }
}
