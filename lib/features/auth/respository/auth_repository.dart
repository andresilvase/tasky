import 'dart:convert';

import 'package:taski/features/auth/model/auth_result.dart';
import 'package:taski/features/auth/model/auth_data.dart';
import 'package:taski/core/db/hive/hive_boxes.dart';
import 'package:taski/core/db/abstract_db.dart';

class AuthRepository {
  final Database _db;

  AuthRepository(this._db);

  Future<AuthResult> login(AuthData auth) async {
    final Map authData = await _db.get(HiveBoxes.auth, auth.username);
    if (authData.isNotEmpty) {
      final encryptedPassword = base64Encode(utf8.encode(auth.password));

      if (authData['password'] == encryptedPassword) {
        return AuthResult.successfulLogin;
      } else {
        return AuthResult.wrongPassword;
      }
    } else {
      return AuthResult.userNotFound;
    }
  }

  Future<AuthResult> register(AuthData auth) async {
    final Map authData = await _db.get(HiveBoxes.auth, auth.username);

    if (authData.isNotEmpty) {
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
