import 'package:taski/features/language/model/locale.dart';
import 'package:test/test.dart';

void main() {
  group('LocaleModel', () {
    test('should create a LocaleModel instance', () {
      final localeModel = LocaleModel(languageCode: 'en');
      expect(localeModel, isNotNull);
    });
  });
}
