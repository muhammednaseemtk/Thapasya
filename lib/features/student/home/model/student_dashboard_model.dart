class StudentDashboardModel {
  final String studentName;
  final String greeting;
  final String course;
  final String batch;
  final int attendance;
  final String pendingFee;
  final String nextClassTime;

  StudentDashboardModel({
    required this.studentName,
    required this.greeting,
    required this.course,
    required this.batch,
    required this.attendance,
    required this.pendingFee,
    required this.nextClassTime,
  });

  factory StudentDashboardModel.fromJson(Map<String, dynamic> json) {
    return StudentDashboardModel(
      studentName: json['student_name'] ?? '',
      greeting: json['greeting'] ?? 'Good Morning',
      course: json['course'] ?? '',
      batch: json['batch'] ?? '',
      attendance: json['attendance'] ?? 0,
      pendingFee: json['pending_fee'] ?? '0',
      nextClassTime: json['next_class_time'] ?? '',
    );
  }
}
