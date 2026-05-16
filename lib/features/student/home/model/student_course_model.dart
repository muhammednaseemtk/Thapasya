class StudentCourseModel {
  final int id;
  final String name;

  StudentCourseModel({required this.id, required this.name});

  factory StudentCourseModel.fromJson(Map<String, dynamic> json) {
    return StudentCourseModel(id: json['id'] ?? 0, name: json['name'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
