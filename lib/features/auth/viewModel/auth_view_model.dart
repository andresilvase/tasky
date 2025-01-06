import 'dart:convert';

import 'package:taski/core/utils/extensions.dart';
import 'package:taski/features/auth/model/auth_result.dart';
import 'package:taski/features/auth/respository/auth_repository.dart';
import 'package:taski/features/auth/model/auth_data.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  AuthViewModel(this._repository);

  final AuthRepository _repository;

  final RxBool _isPasswordVisible = false.obs;
  final RxBool _isInErrorState = false.obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isLogin = true.obs;

  bool get isPasswordVisible => _isPasswordVisible.value;
  bool get isInErrorState => _isInErrorState.value;
  bool get isLoading => _isLoading.value;
  bool get isLogin => _isLogin.value;

  void setPasswordVisible() => _isPasswordVisible.value = !_isPasswordVisible.value;
  void setErrorState(bool value) => _isInErrorState.value = value;
  void toggleAuthMode() => _isLogin.value = !_isLogin.value;
  void setLoading(bool value) => _isLoading.value = value;

  Future<AuthResult> login(String username, String password) async {
    AuthData authData = AuthData(username: username, password: password);

    setLoading(true);
    final result = await _repository.login(authData);
    setLoading(false);

    return result;
  }

  Future<AuthResult> register(String username, String password) async {
    AuthData authData = AuthData(
      username: username.trim().removeAccents(),
      password: base64Encode(
        utf8.encode(password),
      ),
    );

    setLoading(true);
    final result = await _repository.register(authData);
    setLoading(false);

    return result;
  }
}
