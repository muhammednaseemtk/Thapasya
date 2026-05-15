import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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

      debugPrint("STATUS CODE : ${response.statusCode}");

      debugPrint("RESPONSE : ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;

        /// SUCCESS CHECK
        if (data != null &&
            (data["status"] == true ||
                data["success"] == true ||
                data["id"] != null)) {
          return "success";
        }

        return data["message"] ?? "Submission failed";
      }

      return "Failed to submit log";
    } on DioException catch (e) {
      debugPrint("DIO ERROR : ${e.response?.data}");

      return e.response?.data?["message"] ?? "Server Error";
    } catch (e) {
      debugPrint("ERROR : $e");

      return "Something went wrong";
    }
  }
}
