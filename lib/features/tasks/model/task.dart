enum TaskProperty { description, isCompleted, title, id }

class Task {
  final String description;
  final bool isCompleted;
  final String title;
  final String id;

  Task({
    required this.description,
    required this.isCompleted,
    required this.title,
    required this.id,
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      description: map[TaskProperty.description.name],
      isCompleted: map[TaskProperty.isCompleted.name],
      title: map[TaskProperty.title.name],
      id: map[TaskProperty.id.name],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      TaskProperty.description.name: description,
      TaskProperty.isCompleted.name: isCompleted,
      TaskProperty.title.name: title,
      TaskProperty.id.name: id,
    };
  }

  Task copyWith({
    String? description,
    bool? isCompleted,
    String? title,
    String? id,
  }) {
    return Task(
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      title: title ?? this.title,
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
        other.id == id;
  }

  @override
  int get hashCode => description.hashCode ^ isCompleted.hashCode ^ title.hashCode ^ id.hashCode;

  @override
  String toString() => 'Task(description: $description, isCompleted: $isCompleted, title: $title, id: $id)';
}
