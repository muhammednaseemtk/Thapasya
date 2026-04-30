import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/dio_client.dart';
import 'package:thapasya/features/staff/home/model/schedule_model.dart';

class ScheduleService {
  Future<List<ScheduleModel>> getSchedule(int courseId) async {
    try {
      final response = await DioClient.dio.get(
        AppUrls.schedule,
        queryParameters: {"course_id": courseId},
        options: DioClient.authOptions(),
      );

      final data = response.data;

      if (data is List) {
        return data.map((e) => ScheduleModel.fromJson(e)).toList();
      }

      if (data is Map && data['data'] is List) {
        return (data['data'] as List)
            .map((e) => ScheduleModel.fromJson(e))
            .toList();
      }

      return [];
    } catch (e) {
      print("Schedule Error: $e");
      return [];
    }
  }
}
