import 'package:taski/features/auth/model/auth_result.dart';
import 'package:taski/features/auth/model/user.dart';
import 'package:taski/core/db/hive/hive_boxes.dart';
import 'package:taski/core/db/abstract_db.dart';
import 'dart:convert';

class AuthRepository {
  final Database _db;

  AuthRepository(this._db);

  Future<User?> getActiveUser() async {
    final list = await _db.getAll(HiveBoxes.activeUser);

    if (list.isEmpty) return null;

    final map = list.first;

    return map.isNotEmpty ? User.fromMap(map) : null;
  }

  Future<AuthResult> login(User auth) async {
    final Map user = await _db.get(HiveBoxes.auth, auth.username);

    if (user.isNotEmpty) {
      final encryptedPassword = base64Encode(utf8.encode(auth.password));

      if (user['password'] == encryptedPassword) {
        await _db.update(HiveBoxes.activeUser, auth.toMap(), auth.username);
        return AuthResult.successfulLogin;
      } else {
        return AuthResult.wrongPassword;
      }
    } else {
      return AuthResult.userNotFound;
    }
  }

  Future<AuthResult> register(User auth) async {
    final Map user = await _db.get(HiveBoxes.auth, auth.username);

    if (user.isNotEmpty) {
      return AuthResult.registrationFailed;
    }

    final affectedRows = await _db.insert(HiveBoxes.auth, auth.toMap());

    if (affectedRows > 0) {
      return AuthResult.successfulRegistration;
    } else {
      return AuthResult.registrationFailed;
    }
  }
}
