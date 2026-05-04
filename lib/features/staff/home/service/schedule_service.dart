import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/dio_client.dart';
import 'package:thapasya/features/staff/home/model/schedule_model.dart';

class ScheduleService {
  Future<List<ScheduleModel>> getSchedule(int courseId) async {
    try {
      final response = await DioClient.dio.get(
        AppUrls.schedule,
        queryParameters: {"course_id": courseId},
      );

      final res = response.data;

      if (res is List) {
        return res.map((e) => ScheduleModel.fromJson(e)).toList();
      }

      if (res is Map<String, dynamic>) {
        final list = res['data'] ?? res['schedule'];

        if (list is List) {
          return list.map((e) => ScheduleModel.fromJson(e)).toList();
        }
      }

      return [];
    } catch (e) {
      print("Schedule Error: $e");
      return [];
    }
  }
}