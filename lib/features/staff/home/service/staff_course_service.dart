import 'package:dio/dio.dart';
import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/features/staff/home/model/staff_course_model.dart';

class StaffCourseService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppUrls.baseUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<List<StaffCourseModel>?> getCourses(String endpoint) async {
    try {
      final response = await dio.get(endpoint);

      if (response.statusCode == 200) {
        final List data = response.data;

        return data
            .map((e) => StaffCourseModel.fromJson(e))
            .toList();
      } else {
        return null;
      }
    } on DioException catch (e) {
      print("Dio Error: ${e.response?.data}");
      return null;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}