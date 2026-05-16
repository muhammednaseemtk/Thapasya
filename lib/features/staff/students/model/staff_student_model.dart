class StaffStudentModel {
  final int id;
  final String name;

  StaffStudentModel({required this.id, required this.name});

  factory StaffStudentModel.fromJson(Map<String, dynamic> json) {
    return StaffStudentModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Unknown',
    );
  }
}
