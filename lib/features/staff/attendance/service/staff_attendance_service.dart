import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/dio_client.dart';
import '../model/staff_attendance_model.dart';

class StaffAttendanceService {
  Future<String> submitAttendance(
    List<StaffAttendanceRequestModel> data,
  ) async {
    try {
      for (final item in data) {
        final response = await DioClient.dio.post(
          AppUrls.markAttendance,

          data: item.toJson(),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          continue;
        }

        if (response.statusCode == 400 &&
            response.data.toString().contains("duplicate key value")) {
          return "Attendance already submitted today";
        }

        return "Failed to submit attendance";
      }

      return "success";
    } catch (e) {
      return "Something went wrong";
    }
  }
}
