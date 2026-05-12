import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/dio_client.dart';
import '../model/past_log_model.dart';

class PastLogService {
  Future<List<PastLogModel>> getLogs(int staffId) async {
    try {
      final response = await DioClient.dio.get(
        AppUrls.getDailyLogs,
        queryParameters: {"staff_id": staffId},
      );

      final data = response.data;

      if (data is List) {
        return data.map((e) => PastLogModel.fromJson(e)).toList();
      }

      return [];
    } catch (e) {
      return [];
    }
  }
}
