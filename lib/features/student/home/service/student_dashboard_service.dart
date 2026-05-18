import 'package:flutter/foundation.dart';
import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/dio_client.dart';
import 'package:thapasya/features/student/home/model/student_dashboard_model.dart';

class StudentDashboardService {
  Future<StudentDashboardModel?> getDashboard(int courseId) async {
    try {
      final response = await DioClient.dio.get(
        '${AppUrls.studentDashboard}$courseId',
      );

      debugPrint("Dashboard API Response: ${response.data}");
      debugPrint("Dashboard API Status: ${response.statusCode}");

      if (response.statusCode == 200) {
        return StudentDashboardModel.fromJson(response.data);
      }

      return null;
    } catch (e) {
      debugPrint("StudentDashboardService ERROR: $e");
      return null;
    }
  }
}
