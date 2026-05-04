import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/dio_client.dart';
import 'package:thapasya/features/staff/students/model/staff_student_model.dart';

class StaffStudentService {
  Future<List<StaffStudentModel>> getStudents({
    required int courseId,
    required int branchId,
  }) async {
    try {
      final response = await DioClient.dio.get(
        AppUrls.staffStudents,
        queryParameters: {
          "course_id": courseId,
          "branch_id": branchId,
        },
      );

      final res = response.data;

      if (res is List) {
        return res.map((e) => StaffStudentModel.fromJson(e)).toList();
      }

      if (res is Map<String, dynamic>) {
        final list = res['data'] ?? res['students'];

        if (list is List) {
          return list.map((e) => StaffStudentModel.fromJson(e)).toList();
        }
      }

      return [];
    } catch (e) {
      print("Student API Error: $e");
      return [];
    }
  }
}