enum TaskProperty { description, isCompleted, title, id, date }

class Task {
  final String? description;
  final bool isCompleted;
  final DateTime date;
  final String title;
  final String id;

  Task({
    required this.isCompleted,
    required this.title,
    required this.date,
    required this.id,
    this.description,
  });

  factory Task.fromMap(Map map) {
    return Task(
      description: map[TaskProperty.description.name],
      isCompleted: map[TaskProperty.isCompleted.name],
      title: map[TaskProperty.title.name],
      date: map[TaskProperty.date.name],
      id: map[TaskProperty.id.name],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      TaskProperty.description.name: description,
      TaskProperty.isCompleted.name: isCompleted,
      TaskProperty.title.name: title,
      TaskProperty.date.name: date,
      TaskProperty.id.name: id,
    };
  }

  Task copyWith({
    String? description,
    bool? isCompleted,
    DateTime? date,
    String? title,
    String? id,
  }) {
    return Task(
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      title: title ?? this.title,
      date: date ?? this.date,
      id: id ?? this.id,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.description == description &&
        other.isCompleted == isCompleted &&
        other.title == title &&
        other.date == date &&
        other.id == id;
  }

  @override
  int get hashCode => description.hashCode ^ isCompleted.hashCode ^ title.hashCode ^ id.hashCode ^ date.hashCode;

  @override
  String toString() =>
      'Task(description: $description, isCompleted: $isCompleted, title: $title, id: $id, date: $date)';
}
