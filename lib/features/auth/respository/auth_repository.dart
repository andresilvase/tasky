import 'package:tasky/features/auth/model/auth_result.dart';
import 'package:tasky/features/auth/model/user.dart';
import 'package:tasky/core/db/hive/hive_boxes.dart';
import 'package:tasky/core/db/abstract_db.dart';

class AuthRepository {
  final Database _db;

  AuthRepository(this._db);

  Future<User?> getActiveUser() async {
    final list = await _db.getAll(HiveBoxes.activeUser);

    if (list.isEmpty) return null;

    final map = list.first;

    return map.isNotEmpty ? User.fromMap(map) : null;
  }

  Future updateActiveUser(User user) async {
    await _db.insert(HiveBoxes.activeUser, user.toMap());
  }

  Future updateUserAccount(User user) async {
    await _db.update(HiveBoxes.auth, user.toMap(), user.username);
  }

  Future<AuthResult> register(User user) async {
    final Map existentUser = await _db.get(HiveBoxes.auth, user.username);

    if (existentUser.isNotEmpty) {
      return AuthResult.registrationFailed();
    }

    final affectedRows = await _db.insert(HiveBoxes.auth, user.toMap());

    if (affectedRows > 0) {
      return AuthResult.successfulRegistration();
    } else {
      return AuthResult.registrationFailed();
    }
  }

  Future<AuthResult> login(User user) async {
    final Map existentUser = await _db.get(HiveBoxes.auth, user.username);

    if (existentUser.isNotEmpty) {
      if (existentUser['password'] == user.password) {
        await _db.update(HiveBoxes.activeUser, user.toMap(), user.username);
        return AuthResult.successfulLogin();
      } else {
        return AuthResult.wrongPassword();
      }
    } else {
      return AuthResult.userNotFound();
    }
  }

  Future<void> logout() async {
    await _db.clear(HiveBoxes.activeUser);
  }
}
