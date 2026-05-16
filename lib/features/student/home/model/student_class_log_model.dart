class StudentClassLogModel {
  final String date;
  final String title;

  StudentClassLogModel({
    required this.date,
    required this.title,
  });

  factory StudentClassLogModel.fromJson(Map<String, dynamic> json) {
    return StudentClassLogModel(
      date: json['date'] ?? '',
      title: json['title'] ?? json['class_summary'] ?? '',
    );
  }
}
