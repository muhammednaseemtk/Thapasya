import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/dio_client.dart';
import '../model/staff_attendance_model.dart';

class StaffAttendanceService {
  Future<bool> submitAttendance(List<StaffAttendanceRequestModel> data) async {
    try {
      for (final item in data) {
        final response = await DioClient.dio.post(
          AppUrls.markAttendance,

          data: item.toJson(),
        );

        print(response.data);

        if (response.statusCode == 200 || response.statusCode == 201) {
          continue;
        }

        return false;
      }

      return true;
    } catch (e) {
      print("ATTENDANCE API ERROR => $e");

      return false;
    }
  }
}
