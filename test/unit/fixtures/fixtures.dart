import 'package:tasky/features/auth/model/user.dart';
import 'package:tasky/features/language/model/locale.dart';

final defaultLocale = LocaleModel(languageCode: 'en');
final localeMap = defaultLocale.toMap();

final defaultUser = User.empty();
final defaultUserMap = defaultUser.toMap();

final userWithPassword = defaultUser.copyWith(password: '123456');
final userWithPasswordCiphered = userWithPassword.copyWith(password: 'MTIzNDU2');

final userPhotoPath = '/path/to/resource/photo.jpg';
final userUpdatePhotoPath = '/path/to/app/directory/photo.jpg';

final userWithPhoto = defaultUser.copyWith(photoPath: userPhotoPath);

final userWithDisplayName = defaultUser.copyWith(displayName: 'John Doe');

final defaultUserWithInvalidPassword = defaultUser.copyWith(password: 'invalid');

final localeList = [localeMap];

final String fakeAppPath = '/path/to/app/directory';
