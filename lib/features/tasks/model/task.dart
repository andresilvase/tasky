enum TaskProperty { description, isCompleted, title }

class Task {
  final String description;
  final bool isCompleted;
  final String title;

  Task({
    required this.description,
    required this.isCompleted,
    required this.title,
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      description: map[TaskProperty.description.name],
      isCompleted: map[TaskProperty.isCompleted.name],
      title: map[TaskProperty.title.name],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      TaskProperty.description.name: description,
      TaskProperty.isCompleted.name: isCompleted,
      TaskProperty.title.name: title,
    };
  }

  Task copyWith({
    String? description,
    bool? isCompleted,
    String? title,
  }) {
    return Task(
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      title: title ?? this.title,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.description == description &&
        other.isCompleted == isCompleted &&
        other.title == title;
  }

  @override
  int get hashCode => description.hashCode ^ isCompleted.hashCode ^ title.hashCode;

  @override
  String toString() => 'Task(description: $description, isCompleted: $isCompleted, title: $title)';
}
