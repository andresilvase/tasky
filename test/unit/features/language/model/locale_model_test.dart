import 'package:taski/features/language/model/locale.dart';
import 'package:test/test.dart';

void main() {
  group('LocaleModel', () {
    test('should create a LocaleModel instance', () {
      final localeModel = LocaleModel(languageCode: 'en');
      expect(localeModel, isNotNull);
    });

    test('should create a LocaleModel instance from a map', () {
      final map = {'languageCode': 'en'};
      final localeModel = LocaleModel.fromMap(map);
      expect(localeModel, isNotNull);
    });

    test('should create a map from a LocaleModel instance', () {
      final localeModel = LocaleModel(languageCode: 'en');
      final map = localeModel.toMap();
      expect(map, isNotNull);
    });

    test('should create a LocaleModel instance from a existing one', () {
      final localeModel = LocaleModel(languageCode: 'en');

      final newLocaleModel = localeModel.copyWith(
        languageCode: 'es',
      );

      expect(newLocaleModel.languageCode, 'es');
    });

    test('should have the same hashCode', () {
      final localeModel = LocaleModel(languageCode: 'en');
      final localeModel2 = LocaleModel(languageCode: 'en');

      expect(localeModel.hashCode, equals(localeModel2.hashCode));
    });
  });
}
