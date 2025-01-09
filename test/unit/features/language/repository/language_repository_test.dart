import 'package:taski/features/language/repository/language_repository.dart';
import 'package:taski/core/db/abstract_db.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../fixtures/fixtures.dart';
import '../../../mocks/mocks.mocks.dart';
import 'package:test/test.dart';

@GenerateMocks([Database])
void main() {
  group('Language Repository', () {
    late LanguageRepository repository;
    late Database db;

    setUp(() {
      db = MockDatabase();
      repository = LanguageRepository(db);
    });

    test('should save a locale', () async {
      when(db.insert('locale', localeMap)).thenAnswer((_) async => 1);
      await repository.saveLocale(defaultLocale);

      verify(db.insert('locale', localeMap)).called(1);
    });

    test('should get a locale', () async {
      when(db.getAll('locale')).thenAnswer((_) async => [localeMap]);
      final result = await repository.getLocale();
      expect(result, equals(defaultLocale));
    });

    test('should get a default locale when no locale is found', () async {
      when(db.getAll('locale')).thenAnswer((_) async => []);
      final result = await repository.getLocale();

      expect(result, equals(defaultLocale));
    });
  });
}
