class StudentDashboardModel {
  final String studentName;
  final String greeting;

  StudentDashboardModel({
    required this.studentName,
    required this.greeting,
  });

  factory StudentDashboardModel.fromJson(Map<String, dynamic> json) {
    return StudentDashboardModel(
      studentName: json['student_name'] ?? '',
      greeting: json['greeting'] ?? 'Good Morning',
    );
  }
}
