class StaffCourseModel {
  final int id;
  final String name;

  StaffCourseModel({
    required this.id,
    required this.name,
  });

  factory StaffCourseModel.fromJson(Map<String, dynamic> json) {
    return StaffCourseModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Unknown',
    );
  }
}
