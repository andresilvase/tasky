class HiveDataTest {
  final String name;
  final int id;

  HiveDataTest({required this.name, required this.id});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  factory HiveDataTest.fromMap(Map<dynamic, dynamic> map) {
    return HiveDataTest(
      name: map['name'],
      id: map['id'],
    );
  }

  HiveDataTest copyWith({
    String? name,
    int? id,
  }) {
    return HiveDataTest(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }
}
