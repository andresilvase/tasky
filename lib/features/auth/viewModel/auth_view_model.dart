import 'package:tasky/features/auth/respository/auth_repository.dart';
import 'package:tasky/features/auth/model/auth_result.dart';
import 'package:tasky/features/auth/model/user.dart';
import 'package:tasky/core/utils/extensions.dart';
import 'package:tasky/core/utils/functions.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';

class AuthViewModel extends GetxController {
  AuthViewModel(this._repository);

  final AuthRepository _repository;

  final RxBool _isPasswordVisible = false.obs;
  final RxBool _isInErrorState = false.obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isLogin = true.obs;

  final Rx<User> activeUser = User.empty().obs;

  void setActiveUser(User user) => activeUser.value = user;

  bool get isLoggedIn => activeUser.value != User.empty();

  bool get isPasswordVisible => _isPasswordVisible.value;
  bool get isInErrorState => _isInErrorState.value;
  bool get isLoading => _isLoading.value;
  bool get isLogin => _isLogin.value;

  void setPasswordVisible() => _isPasswordVisible.value = !_isPasswordVisible.value;
  void toggleAuthMode({bool? value}) => _isLogin.value = value ?? !_isLogin.value;
  void setErrorState(bool value) => _isInErrorState.value = value;
  void setLoading(bool value) => _isLoading.value = value;

  Future<void> _updateUserPersistentData({File Function(String)? fileFactory}) async {
    if (activeUser.value.photoPath != null && activeUser.value.photoPath!.isNotEmpty) {
      final newPath = await saveToAppDirectory(activeUser.value.photoPath!, fileFactory: fileFactory);
      activeUser.value = activeUser.value.copyWith(photoPath: newPath);
    }

    _repository.updateActiveUser(activeUser.value);
    _repository.updateUserAccount(activeUser.value);
  }

  void setUserDisplayName(String displayName) {
    setActiveUser(activeUser.value.copyWith(displayName: displayName));
  }

  void setUserPhoto(String photoPath) {
    setActiveUser(activeUser.value.copyWith(photoPath: photoPath));
  }

  void updateUserData({File Function(String)? fileFactory}) {
    _updateUserPersistentData(fileFactory: fileFactory);
  }

  Future<void> initSession() async {
    final activeUser = await _repository.getActiveUser();

    if (activeUser != null) {
      setActiveUser(activeUser);
    }
  }

  Future<AuthResult> register(String username, String password) async {
    User user = User(
      username: username.trim().removeAccents().toLowerCase(),
      password: base64Encode(
        utf8.encode(password.trim().removeAccents()),
      ),
    );

    setLoading(true);
    final result = await _repository.register(user);

    if (result.ok) {
      await login(username, password);
    }

    setLoading(false);

    return result;
  }

  Future<AuthResult> login(String username, String password) async {
    User user = User(
      username: username.trim().removeAccents().toLowerCase(),
      password: base64Encode(
        utf8.encode(password.trim().removeAccents()),
      ),
    );

    setLoading(true);
    final result = await _repository.login(user);

    if (result.ok) {
      await initSession();
    }

    setLoading(false);

    return result;
  }

  Future<void> logout() async {
    _isLogin(true);
    await _repository.logout();
    setActiveUser(User.empty());
  }
}
