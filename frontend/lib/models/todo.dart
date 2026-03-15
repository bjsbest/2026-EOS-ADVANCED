class Todo{
  final int? id; // Todo마다 할당되는 ID
  final String title; // 내용
  bool completed; // 완료 여부
  final DateTime date; // Todo의 날짜
  final int userId; // 이 Todo가 누구의 Todo인지!

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