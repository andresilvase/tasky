import 'package:tasky/features/language/model/locale.dart';
import 'package:tasky/core/db/abstract_db.dart';

class LanguageRepository {
  LanguageRepository(this._db);

  final Database _db;

  final String table = 'locale';

  Future<void> saveLocale(LocaleModel locale) async {
    await _db.insert(table, locale.toMap());
  }

  Future<LocaleModel> getLocale() async {
    final locales = await _db.getAll(table);

    if (locales.isEmpty) {
      return LocaleModel(languageCode: 'en');
    }

    return LocaleModel.fromMap(locales.first);
  }
}
