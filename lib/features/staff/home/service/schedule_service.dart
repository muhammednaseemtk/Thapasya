import 'package:thapasya/core/network/dio_client.dart';
import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/features/staff/home/model/schedule_model.dart';

class ScheduleService {

  Future<List<ScheduleModel>?> getSchedule(int courseId) async {
    try {
      final response = await DioClient.dio.get(
        AppUrls.schedule,
        queryParameters: {"course_id": courseId},
        options: DioClient.authOptions(), 
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