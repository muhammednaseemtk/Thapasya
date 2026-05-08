import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/dio_client.dart';
import '../model/attendance_model.dart';

class StaffAttendanceService {
  Future<bool> submitAttendance(List<AttendanceRequestModel> data) async {
    try {
      for (final item in data) {
        final response = await DioClient.dio.post(
          AppUrls.markAttendance,
          data: item.toJson(),
        );

        if (response.statusCode != 200 && response.statusCode != 201) {
          return false;
        }
      }

      return true;
    } catch (e) {
      print("ATTENDANCE API ERROR: $e");
      return false;
    }
  }
}
