class PastLogModel {
  final int id;
  final int staffId;
  final int courseId;
  final String date;
  final String classSummary;
  final String topicsCovered;
  final String nextClassTopic;

  PastLogModel({
    required this.id,
    required this.staffId,
    required this.courseId,
    required this.date,
    required this.classSummary,
    required this.topicsCovered,
    required this.nextClassTopic,
  });

  factory PastLogModel.fromJson(Map<String, dynamic> json) {
    return PastLogModel(
      id: json["id"] as int? ?? 0,
      staffId: json["staff_id"] as int? ?? 0,
      courseId: json["course_id"] as int? ?? 0,
      date: json["date"] as String? ?? '',
      classSummary: json["class_summary"] as String? ?? '',
      topicsCovered: json["topics_covered"] as String? ?? '',
      nextClassTopic: json["next_class_topic"] as String? ?? '',
    );
  }
}
