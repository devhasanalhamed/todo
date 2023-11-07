class TaskModel {
  final String id;
  final String title;
  final String description;
  final String date;
  final String time;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
  });

  factory TaskModel.fromSQL(Map<String, dynamic> record) {
    return TaskModel(
      id: record['id'] as String,
      title: record['title'] as String,
      description: record['description'] as String,
      date: record['date'] as String,
      time: record['time'] as String,
    );
  }
}
