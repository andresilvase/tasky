import 'package:taski/features/auth/respository/auth_repository.dart';
import 'package:taski/features/auth/model/auth_result.dart';
import 'package:taski/features/auth/model/user.dart';
import 'package:taski/core/utils/extensions.dart';
import 'package:get/get.dart';
import 'dart:convert';

class AuthViewModel extends GetxController {
  AuthViewModel(this._repository);

  final AuthRepository _repository;

  final RxBool _isPasswordVisible = false.obs;
  final RxBool _isInErrorState = false.obs;
  final RxBool _isLoading = false.obs;
  final RxBool _isLogin = true.obs;

  final Rx<User?> _activeUser = User.empty().obs;
  User? get activeUser => _activeUser.value;

  void setActiveUser(User? user) => _activeUser.value = user;

  bool get isPasswordVisible => _isPasswordVisible.value;
  bool get isInErrorState => _isInErrorState.value;
  bool get isLoading => _isLoading.value;
  bool get isLogin => _isLogin.value;

  void setPasswordVisible() => _isPasswordVisible.value = !_isPasswordVisible.value;
  void setErrorState(bool value) => _isInErrorState.value = value;
  void toggleAuthMode() => _isLogin.value = !_isLogin.value;
  void setLoading(bool value) => _isLoading.value = value;

  Future<void> init() async {
    final activeUser = await _repository.getActiveUser();

    if (activeUser != null) {
      setActiveUser(activeUser);
    }
  }

  Future<AuthResult> register(String username, String password) async {
    User user = User(
      username: username.trim().removeAccents(),
      password: base64Encode(
        utf8.encode(password),
      ),
    );

    setLoading(true);
    final result = await _repository.register(user);
    setLoading(false);

    return result;
  }

  Future<AuthResult> login(String username, String password) async {
    User user = User(username: username, password: password);

    setLoading(true);
    final result = await _repository.login(user);
    setLoading(false);

    return result;
  }

  Future<void> logout() async {
    await _repository.logout();
    setActiveUser(User.empty());
  }
}
