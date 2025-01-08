import 'dart:convert';

enum LocaleModelProperty { languageCode }

class LocaleModel {
  final String languageCode;

  LocaleModel({required this.languageCode});

  LocaleModel copyWith({
    String? languageCode,
  }) {
    return LocaleModel(languageCode: languageCode ?? this.languageCode);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      LocaleModelProperty.languageCode.name: languageCode,
      'id': 'locale',
    };
  }

  factory LocaleModel.fromMap(Map<dynamic, dynamic> map) {
    return LocaleModel(
      languageCode: map[LocaleModelProperty.languageCode.name] as String,
    );
  }

  factory LocaleModel.fromJson(String source) => LocaleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LocaleModel(languageCode: $languageCode)';

  @override
  bool operator ==(covariant LocaleModel other) {
    if (identical(this, other)) return true;

    return other.languageCode == languageCode;
  }

  @override
  int get hashCode => languageCode.hashCode;
}
