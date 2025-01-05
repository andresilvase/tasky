abstract class Database {
  Future<int> update(String table, Map<String, dynamic> values, String id);
  Future<int> insert(String table, Map<String, dynamic> values);
  Future<int> delete(String table, String where);
  Future<Map> get(String table, String where);
  Future<List<Map>> getAll(String table);
  Future<int> clear(String table);
}
