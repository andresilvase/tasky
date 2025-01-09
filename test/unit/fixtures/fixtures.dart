import 'package:taski/features/auth/model/user.dart';
import 'package:taski/features/language/model/locale.dart';

final defaultLocale = LocaleModel(languageCode: 'en');
final localeMap = defaultLocale.toMap();

final defaultUserMap = {
  UserProperty.username.name: 'default',
  UserProperty.displayName.name: '',
  UserProperty.photoPath.name: '',
  UserProperty.password.name: '',
  'id': 'default',
};

final defaultUser = User.fromMap(defaultUserMap);
final defaultUserWithInvalidPassword = defaultUser.copyWith(password: 'invalid');

final localeList = [localeMap];

final String fakeAppPath = '/path/to/app/directory';
