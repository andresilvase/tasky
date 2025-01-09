import 'package:taski/features/language/repository/language_repository.dart';
import 'package:taski/features/language/model/locale.dart';
import 'package:taski/core/db/abstract_db.dart';
import 'language_repository_test.mocks.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

@GenerateMocks([Database])
void main() {
  group('Language Repository', () {
    test('should save a locale', () async {
      final db = MockDatabase();
      final locale = LocaleModel(languageCode: 'en');
      final repository = LanguageRepository(db);

      when(db.insert('locale', locale.toMap())).thenAnswer((_) async => 1);
      await repository.saveLocale(locale);

      verify(db.insert('locale', locale.toMap())).called(1);
    });

    test('should get a locale', () async {
      final db = MockDatabase();
      final locale = LocaleModel(languageCode: 'en');
      final repository = LanguageRepository(db);

      when(db.getAll('locale')).thenAnswer((_) async => [locale.toMap()]);
      final result = await repository.getLocale();
      expect(result, equals(locale));
    });
  });
}
