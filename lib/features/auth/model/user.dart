import 'dart:convert';

enum UserProperty { username, password, photoPath, displayName }

class User {
  final String displayName;
  final String? photoPath;
  final String username;
  final String password;

  User({
    this.displayName = '',
    required this.username,
    required this.password,
    this.photoPath,
  });

  factory User.empty() => User(username: 'default', password: '');

  User copyWith({
    String? displayName,
    String? photoPath,
    String? username,
    String? password,
  }) {
    return User(
      displayName: displayName ?? this.displayName,
      photoPath: photoPath ?? this.photoPath,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      UserProperty.displayName.name: displayName,
      UserProperty.photoPath.name: photoPath,
      UserProperty.username.name: username,
      UserProperty.password.name: password,
      'id': username,
    };
  }

  factory User.fromMap(Map<dynamic, dynamic> map) {
    return User(
      displayName: map[UserProperty.displayName.name],
      photoPath: map[UserProperty.photoPath.name],
      username: map[UserProperty.username.name],
      password: map[UserProperty.password.name],
    );
  }

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(displayName: $displayName, username: $username, password: $password, photoPath: $photoPath)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.displayName == displayName &&
        other.username == username &&
        other.password == password &&
        other.photoPath == photoPath;
  }

  @override
  int get hashCode {
    return displayName.hashCode ^ username.hashCode ^ password.hashCode ^ photoPath.hashCode;
  }
}
