class DailyLogRequestModel {
  final int courseId;
  final String classSummary;
  final String topicsCovered;
  final String nextClassTopic;

  DailyLogRequestModel({
    required this.courseId,
    required this.classSummary,
    required this.topicsCovered,
    required this.nextClassTopic,
  });

  Map<String, dynamic> toJson() {
    return {
      "course_id": courseId,
      "class_summary": classSummary,
      "topics_covered": topicsCovered,
      "next_class_topic": nextClassTopic,
    };
  }
}
