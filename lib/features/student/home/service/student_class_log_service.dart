import 'package:flutter/foundation.dart';
import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/dio_client.dart';
import 'package:thapasya/features/student/home/model/student_class_log_model.dart';

class StudentClassLogService {
  Future<List<StudentClassLogModel>> getClassLogs(int courseId) async {
    try {
      final response = await DioClient.dio.get(
        AppUrls.studentClassLogs,
        queryParameters: {"course_id": courseId},
      );

      debugPrint("ClassLog API Response: ${response.data}");
      debugPrint("ClassLog API Status: ${response.statusCode}");

      final res = response.data;

      if (res is List) {
        return res.map((e) => StudentClassLogModel.fromJson(e)).toList();
      }

      if (res is Map<String, dynamic>) {
        final list = res['data'] ?? res['logs'];

        if (list is List) {
          return list.map((e) => StudentClassLogModel.fromJson(e)).toList();
        }
      }

      return [];
    } catch (e) {
      debugPrint("StudentClassLogService ERROR: $e");
      return [];
    }
  }
}
