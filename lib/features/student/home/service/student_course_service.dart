import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/dio_client.dart';
import 'package:thapasya/features/student/home/model/student_course_model.dart';

class StudentCourseService {
  Future<List<StudentCourseModel>?> getCourses() async {
    try {
      final response = await DioClient.dio.get(AppUrls.studentCourse);

      debugPrint("StudentCourses API Response: ${response.data}");
      debugPrint("StudentCourses API Status: ${response.statusCode}");

      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((e) => StudentCourseModel.fromJson(e)).toList();
      }

      if (response.statusCode == 401) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Unauthorized - Token error',
        );
      }

      return null;
    } on DioException catch (e) {
      debugPrint("StudentCourseService ERROR: $e");
      if (e.response?.statusCode == 401) {
        rethrow;
      }
      return null;
    } catch (e) {
      debugPrint("StudentCourseService ERROR: $e");
      return null;
    }
  }
}
