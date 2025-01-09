import 'package:taski/features/language/repository/language_repository.dart';
import 'package:taski/features/language/viewModel/language_view_model.dart';
import 'package:taski/features/language/model/locale.dart';
import 'package:taski/core/db/abstract_db.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../fixtures/fixtures.dart';
import '../../mocks/mocks.mocks.dart';

void main() {
  group('Language View Model', () {
    late LanguageRepository repository;
    late LanguageViewModel viewModel;
    late Database db;

    setUp(() {
      db = MockDatabase();
      repository = LanguageRepository(db);
      viewModel = LanguageViewModel(repository);
    });

    test('should save locale', () async {
      when(db.insert('locale', localeMap)).thenAnswer((_) async => 1);

      viewModel.changeLocale('en');

      verify(db.insert('locale', localeMap)).called(1);
    });

    test('should retrieve locale', () async {
      when(db.getAll('locale')).thenAnswer((_) async => localeList);

      expect(viewModel.getLocale(), isA<void>());
    });
  });
}
