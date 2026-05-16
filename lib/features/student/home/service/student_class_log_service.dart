import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/dio_client.dart';
import 'package:thapasya/features/student/home/model/student_class_log_model.dart';

class StudentClassLogService {
  Future<List<StudentClassLogModel>> getClassLogs(int courseId) async {
    try {
      final response = await DioClient.dio.get(
        AppUrls.getDailyLogs,
        queryParameters: {"course_id": courseId},
      );

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
      return [];
    }
  }
}
