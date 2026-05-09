class StaffAttendanceRequestModel {
  final int studentId;
  final int courseId;
  final String status;

  StaffAttendanceRequestModel({
    required this.studentId,
    required this.courseId,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      "student_id": studentId,
      "course_id": courseId,
      "status": status,
    };
  }
}