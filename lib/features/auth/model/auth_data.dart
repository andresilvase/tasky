import 'dart:convert';

enum AuthDataProperty { username, password }

class AuthData {
  final String username;
  final String password;
  AuthData({
    required this.username,
    required this.password,
  });

  AuthData copyWith({
    String? username,
    String? password,
  }) {
    return AuthData(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      AuthDataProperty.username.name: username,
      AuthDataProperty.password.name: password,
    };
  }

  factory AuthData.fromMap(Map<String, dynamic> map) {
    return AuthData(
      username: map[AuthDataProperty.username.name] as String,
      password: map[AuthDataProperty.password.name] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthData.fromJson(String source) => AuthData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AuthData(username: $username, password: $password)';

  @override
  bool operator ==(covariant AuthData other) {
    if (identical(this, other)) return true;

    return other.username == username && other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode;
}
