import 'package:thapasya/features/student/home/model/student_class_log_model.dart';
import 'package:thapasya/features/student/home/model/student_schedule_model.dart';

class StudentDashboardModel {
  final String studentName;
  final String greeting;
  final List<StudentScheduleModel> schedules;
  final List<StudentClassLogModel> recentLogs;

  StudentDashboardModel({
    required this.studentName,
    required this.greeting,
    required this.schedules,
    required this.recentLogs,
  });

  factory StudentDashboardModel.fromJson(Map<String, dynamic> json) {
    final schedulesList =
        (json['schedules'] as List?)
            ?.map((e) => StudentScheduleModel.fromJson(e))
            .toList() ??
        [];
    final logsList =
        (json['recent_logs'] as List?)
            ?.map((e) => StudentClassLogModel.fromJson(e))
            .toList() ??
        [];
    final userInfo = json['user_info'] as Map<String, dynamic>?;
    return StudentDashboardModel(
      studentName: userInfo?['name'] ?? json['student_name'] ?? '',
      greeting: userInfo?['greeting'] ?? json['greeting'] ?? 'Good Morning',
      schedules: schedulesList,
      recentLogs: logsList,
    );
  }
}
