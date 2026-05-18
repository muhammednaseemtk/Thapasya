import 'package:flutter/foundation.dart';
import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/dio_client.dart';
import 'package:thapasya/features/student/home/model/student_schedule_model.dart';

class StudentScheduleService {
  Future<List<StudentScheduleModel>> getSchedule(int courseId) async {
    try {
      final response = await DioClient.dio.get(
        AppUrls.studentSchedule,
        queryParameters: {"course_id": courseId},
      );

      debugPrint("Schedule API Response: ${response.data}");
      debugPrint("Schedule API Status: ${response.statusCode}");

      final res = response.data;

      if (res is List) {
        return res.map((e) => StudentScheduleModel.fromJson(e)).toList();
      }

      if (res is Map<String, dynamic>) {
        final list = res['data'] ?? res['schedule'];

        if (list is List) {
          return list.map((e) => StudentScheduleModel.fromJson(e)).toList();
        }
      }

      return [];
    } catch (e) {
      debugPrint("StudentScheduleService ERROR: $e");
      return [];
    }
  }
}
