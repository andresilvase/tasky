import 'package:taski/core/db/abstract_db.dart';
import 'package:hive/hive.dart';

class HiveDB extends Database {
  HiveDB._();

  static HiveDB get instance => HiveDB._();

  @override
  Future<int> insert(String table, Map<String, dynamic> values) async {
    final Box box = await openBox(table);
    await box.put(values['id'], values);

    return box.length;
  }

  @override
  Future<Map<String, dynamic>> get(String table, String where) async {
    final Box box = await openBox(table);
    return box.get(where);
  }

  @override
  Future<List<Map>> getAll(String table) async {
    final Box box = await openBox(table);
    List<Map> list = [];
    Map map = box.toMap();

    map.forEach((key, value) {
      list.add(value);
    });

    return list;
  }

  @override
  Future<int> update(String table, Map<String, dynamic> values, String id) async {
    final Box box = await openBox(table);
    box.put(id, values);
    return box.length;
  }

  @override
  Future<int> delete(String table, String where) async {
    final Box box = await openBox(table);
    box.delete(where);
    return box.length;
  }

  @override
  Future<int> clear(String table) async {
    final Box box = await openBox(table);
    await box.clear();
    return box.length;
  }

  Future<Box> openBox(String boxName) async {
    return await Hive.openBox(boxName);
  }

  Future openBoxes(List<String> boxesName) async {
    return await Future.wait(boxesName.map((boxName) async {
      return await openBox(boxName);
    }));
  }
}
