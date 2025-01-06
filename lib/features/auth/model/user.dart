import 'dart:convert';

enum UserModelProperty { displayName, username, photoUrl }

class UserModel {
  final String displayName;
  final String username;
  final String? photoUrl;

  UserModel({
    required this.displayName,
    required this.username,
    this.photoUrl,
  });

  UserModel copyWith({
    String? displayName,
    String? username,
    String? photoUrl,
  }) {
    return UserModel(
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      UserModelProperty.displayName.name: displayName,
      UserModelProperty.username.name: username,
      UserModelProperty.photoUrl.name: photoUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      displayName: map[UserModelProperty.displayName.name] as String,
      photoUrl: map[UserModelProperty.photoUrl.name] as String?,
      username: map[UserModelProperty.username.name],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(displayName: $displayName, username: $username, photoUrl: $photoUrl)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.displayName == displayName && other.username == username && other.photoUrl == photoUrl;
  }

  @override
  int get hashCode => displayName.hashCode ^ username.hashCode ^ photoUrl.hashCode;
}
