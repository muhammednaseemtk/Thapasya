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
      id: json["id"],
      staffId: json["staff_id"],
      courseId: json["course_id"],
      date: json["date"],
      classSummary: json["class_summary"],
      topicsCovered: json["topics_covered"],
      nextClassTopic: json["next_class_topic"],
    );
  }
}
