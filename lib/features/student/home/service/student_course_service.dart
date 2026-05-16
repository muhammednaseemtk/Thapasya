import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/dio_client.dart';
import 'package:thapasya/features/student/home/model/student_course_model.dart';

class StudentCourseService {
  Future<List<StudentCourseModel>?> getCourses() async {
    try {
      final response = await DioClient.dio.get(AppUrls.studentCourse);

      if (response.statusCode == 200) {
        final List data = response.data;

        return data.map((e) => StudentCourseModel.fromJson(e)).toList();
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}
