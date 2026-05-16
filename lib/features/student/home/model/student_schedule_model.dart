class StudentScheduleModel {
  final String day;
  final String subject;
  final String time;

  StudentScheduleModel({
    required this.day,
    required this.subject,
    required this.time,
  });

  factory StudentScheduleModel.fromJson(Map<String, dynamic> json) {
    return StudentScheduleModel(
      day: json['day'] ?? json['class_date'] ?? '',
      subject: json['subject'] ?? json['course'] ?? '',
      time: json['time'] ?? json['class_time'] ?? '',
    );
  }
}
