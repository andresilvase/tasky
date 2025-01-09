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

  @override
  bool operator ==(covariant LocaleModel other) {
    if (identical(this, other)) return true;

    return other.languageCode == languageCode;
  }

  @override
  int get hashCode => languageCode.hashCode;
}
