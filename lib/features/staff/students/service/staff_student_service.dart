import 'package:thapasya/core/network/dio_client.dart';
import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/features/staff/students/model/staff_student_model.dart';

class StaffStudentService {

  Future<List<StaffStudentModel>?> getStudents({
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
        options: DioClient.authOptions(),
      );

      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((e) => StaffStudentModel.fromJson(e)).toList();
      }
    } catch (e) {
      print("Student API Error: $e");
    }
    return null;
  }
}