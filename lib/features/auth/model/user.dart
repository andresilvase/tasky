import 'package:taski/features/auth/model/auth_data.dart';
import 'dart:convert';

enum UserModelProperty { displayName, authData }

class UserModel {
  final String displayName;
  final AuthData authData;
  UserModel({
    required this.displayName,
    required this.authData,
  });

  UserModel copyWith({
    String? displayName,
    AuthData? authData,
  }) {
    return UserModel(
      displayName: displayName ?? this.displayName,
      authData: authData ?? this.authData,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      UserModelProperty.displayName.name: displayName,
      UserModelProperty.authData.name: authData.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      displayName: map[UserModelProperty.displayName.name] as String,
      authData: AuthData.fromMap(UserModelProperty.authData.name as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(displayName: $displayName, authData: $authData)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.displayName == displayName && other.authData == authData;
  }

  @override
  int get hashCode => displayName.hashCode ^ authData.hashCode;
}
