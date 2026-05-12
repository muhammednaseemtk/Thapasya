import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/dio_client.dart';
import '../model/daily_log_request_model.dart';

class DailyLogService {
  Future<String> submitLog(DailyLogRequestModel model) async {
    try {
      final response = await DioClient.dio.post(
        AppUrls.submitDailyLog,
        data: model.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return "success";
      }

      return "Failed to submit";
    } catch (e) {
      return "Something went wrong";
    }
  }
}
