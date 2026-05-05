class AttendanceRequestModel {
  final int studentId;
  final int courseId;
  final String status;

  AttendanceRequestModel({
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