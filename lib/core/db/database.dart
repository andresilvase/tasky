abstract class Database {
  Future<int> update(String table, Map<String, dynamic> values, String id);
  Future<int> insert(String table, Map<String, dynamic> values);
  Future<Map<String, dynamic>> get(String table, String where);
  Future<List<Map<String, dynamic>>> getAll(String table);
  Future<int> delete(String table, String where);
  Future<int> clear(String table);
}
