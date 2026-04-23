import 'package:dio/dio.dart';
import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/auth_token.dart';
import 'package:thapasya/features/staff/home/model/schedule_model.dart';

class ScheduleService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppUrls.baseUrl,
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<List<ScheduleModel>?> getSchedule(int courseId) async {
    try {
      final token = AuthToken.token;

      final response = await dio.get(
        AppUrls.schedule,
        queryParameters: {"course_id": courseId},
        options: Options(
          headers: {
            'Cookie': 'access_token=$token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map((e) => ScheduleModel.fromJson(e)).toList();
      }
    } catch (e) {
      print("Schedule Error: $e");
    }
    return null;
  }
}