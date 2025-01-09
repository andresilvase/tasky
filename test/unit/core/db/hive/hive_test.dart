import 'package:taski/core/db/hive/hive.dart';
import 'package:hive_test/hive_test.dart';
import 'package:test/test.dart';
import 'fixtures/hive_data.dart';

void main() {
  group('HiveDB Test', () {
    late HiveDB hiveDB;
    late String boxName;

    setUp(() async {
      await setUpTestHive();
      hiveDB = HiveDB.instance;
      boxName = 'test';
    });

    test('should open box', () async {
      final box = await hiveDB.openBox(boxName);

      expect(box, isNotNull);
      expect(box.name, boxName);
    });

    test('should open multiple boxes at once', () async {
      final boxNames = ['test1', 'test2', 'test3'];

      await hiveDB.openBoxes(boxNames);

      for (var boxName in boxNames) {
        final box = await hiveDB.openBox(boxName);

        expect(box, isNotNull);
        expect(box.name, boxName);
      }
    });

    test('should insert data', () async {
      final hiveData = HiveDataTest(name: 'test 2', id: 2);

      final affectedRows = await hiveDB.insert(boxName, hiveData.toMap());
      expect(affectedRows, 1);
    });

    test('should get data', () async {
      final hiveData = HiveDataTest(name: 'test 3', id: 3);

      final affectedRows = await hiveDB.insert(boxName, hiveData.toMap());
      expect(affectedRows, 1);

      final result = await hiveDB.get(boxName, hiveData.id);

      expect(result, hiveData.toMap());
    });

    test('should get all data from a box', () async {
      final hiveData = HiveDataTest(name: 'test 4', id: 4);

      final affectedRows = await hiveDB.insert(boxName, hiveData.toMap());
      expect(affectedRows, 1);

      final result = await hiveDB.getAll(boxName);

      final convertedResult = result.map((e) => HiveDataTest.fromMap(e)).toList();

      expect(convertedResult, isA<List<HiveDataTest>>());
    });

    test('should delete data', () async {
      final hiveData = HiveDataTest(name: 'test 5', id: 5);
      final affectedRows = await hiveDB.insert(boxName, hiveData.toMap());

      expect(affectedRows, 1);

      final result = await hiveDB.delete(boxName, hiveData.id);
      expect(result, 1);
    });

    test('should update data', () async {
      final hiveData = HiveDataTest(name: 'test 6', id: 6);

      final affectedRows = await hiveDB.insert(boxName, hiveData.toMap());
      expect(affectedRows, 1);

      final result = await hiveDB.update(
        boxName,
        hiveData.copyWith(name: 'test 6 updated').toMap(),
        hiveData.id,
      );

      expect(result, 1);
    });

    test('should clear data from a box', () async {
      final result = await hiveDB.clear(boxName);
      expect(result, 1);
    });
  });
}
