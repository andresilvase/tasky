import 'package:taski/core/db/abstract_db.dart';
import 'package:hive/hive.dart';

class HiveDB extends Database {
  HiveDB._(this.boxName);

  final String boxName;

  static HiveDB? _instance;

  factory HiveDB.init({required String name}) {
    _instance ??= HiveDB._(name);

    return _instance!;
  }

  static HiveDB get instance {
    if (_instance == null) {
      throw Exception(
        'Database is not initialized yet. Call initialize() first.',
      );
    }

    return _instance!;
  }

  @override
  Future<int> insert(String table, Map<String, dynamic> values) async {
    final Box box = await _openBox(table);
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
    final Box box = await _openBox(table);
    box.delete(where);
    return box.length;
  }

  @override
  Future<int> clear(String table) async {
    final Box box = await _openBox(table);
    await box.clear();
    return box.length;
  }

  Future<Box> _openBox(String boxName) async {
    return await Hive.openBox(boxName);
  }
}
