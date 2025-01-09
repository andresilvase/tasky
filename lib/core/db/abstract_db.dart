abstract class Database {
  Future<int> update(String table, Map<String, dynamic> values, dynamic id);
  Future<int> insert(String table, Map<String, dynamic> values);
  Future<int> delete(String table, dynamic where);
  Future<Map> get(String table, dynamic where);
  Future<List<Map>> getAll(String table);
  Future<int> clear(String table);
}
