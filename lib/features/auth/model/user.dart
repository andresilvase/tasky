import 'dart:convert';

enum UserProperty { username, password, photoURL, displayName }

class User {
  final String displayName;
  final String username;
  final String password;
  final String? photoURL;
  User({
    this.displayName = '',
    required this.username,
    required this.password,
    this.photoURL,
  });

  User copyWith({
    String? displayName,
    String? username,
    String? password,
    String? photoURL,
  }) {
    return User(
      displayName: displayName ?? this.displayName,
      username: username ?? this.username,
      password: password ?? this.password,
      photoURL: photoURL ?? this.photoURL,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      UserProperty.displayName.name: displayName,
      UserProperty.username.name: username,
      UserProperty.password.name: password,
      UserProperty.photoURL.name: photoURL,
    };
  }

  factory User.fromMap(Map<dynamic, dynamic> map) {
    return User(
      displayName: map[UserProperty.displayName.name] as String,
      username: map[UserProperty.username.name] as String,
      password: map[UserProperty.password.name] as String,
      photoURL: map[UserProperty.photoURL.name] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(displayName: $displayName, username: $username, password: $password, photoURL: $photoURL)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.displayName == displayName &&
        other.username == username &&
        other.password == password &&
        other.photoURL == photoURL;
  }

  @override
  int get hashCode {
    return displayName.hashCode ^ username.hashCode ^ password.hashCode ^ photoURL.hashCode;
  }
}
