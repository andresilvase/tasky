import 'package:tasky/features/tasks/model/task.dart';
import 'package:tasky/core/db/database.dart';
import 'package:hive/hive.dart';

class HiveDB extends Database {
  @override
  Future<int> insert(String table, Map<String, dynamic> values) async {
    final Box box = Hive.box(table);
    await box.put(values['id'], values);

    return box.length;
  }

  @override
  Future<Map<String, dynamic>> get(String table, String where) {
    final Box box = Hive.box(table);
    return box.get(where);
  }

  @override
  Future<List<Map<String, dynamic>>> getAll(String table) async {
    final Box box = Hive.box(table);
    List<Map<String, dynamic>> list = [];
    Map map = box.toMap();

    map.forEach((key, value) {
      list.add(value);
    });

    return list;
  }

  @override
  Future<int> update(String table, Map<String, dynamic> values, String id) async {
    final Box box = Hive.box(table);
    box.put(id, values);
    return box.length;
  }

  @override
  Future<int> delete(String table, String where) async {
    final Box box = Hive.box(table);
    box.delete(where);
    return box.length;
  }

  @override
  Future<int> clear(String table) async {
    final Box box = await openBox(table);
    await box.clear();
    await closeBox(table);
    return box.length;
  }

  Future<Box> openBox(String boxName) async {
    return await Hive.openBox<Task>(boxName);
  }

  Future<void> closeBox(String boxName) async {
    await Hive.box(boxName).close();
  }

  Future<void> deleteBox(String boxName) async {
    await Hive.deleteBoxFromDisk(boxName);
  }

  Future<void> deleteAllBoxes() async {
    await Hive.deleteFromDisk();
  }
}
