class ScheduleModel {
  final String classDate;
  final String classTime;
  final String course;

  ScheduleModel({
    required this.classDate,
    required this.classTime,
    required this.course,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      classDate: json['class_date'],
      classTime: json['class_time'],
      course: json['course'],
    );
  }
}