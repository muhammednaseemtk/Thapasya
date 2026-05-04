import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/dio_client.dart';
import 'package:thapasya/features/staff/home/model/staff_course_model.dart';

class StaffCourseService {
  Future<List<StaffCourseModel>?> getCourses() async {
    try {
      final response = await DioClient.dio.get(
        AppUrls.staffCourses,
      );

      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((e) => StaffCourseModel.fromJson(e)).toList();
      }
    } catch (e) {
      print("API ERROR: $e");
    }
    return null;
  }
}