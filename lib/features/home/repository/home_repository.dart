import 'package:taski/features/home/model/locale.dart';
import 'package:taski/core/db/abstract_db.dart';

class HomeRepository {
  HomeRepository(this.db);

  final Database db;

  final String table = 'locale';

  Future<void> saveLocale(LocaleModel locale) async {
    await db.insert(table, locale.toMap());
  }

  Future<LocaleModel> getLocale() async {
    final locales = await db.getAll(table);

    if (locales.isEmpty) {
      return LocaleModel(languageCode: 'en');
    }

    return LocaleModel.fromMap(locales.first);
  }
}
