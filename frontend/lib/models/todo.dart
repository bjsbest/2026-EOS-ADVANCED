class Todo{
  final int? id;
  final String title;
  bool completed;
  final DateTime date;
  final int userId;

  Todo({
    this.id,
    required this.title,
    this.completed = false,
    required this.date,
    required this.userId,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
      date: DateTime.parse(json['date']),
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'completed': completed,
    'date': date.toIso8601String(),
    'userId': userId,
  };
}