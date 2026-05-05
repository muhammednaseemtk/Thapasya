import 'package:thapasya/core/network/dio_client.dart';
import 'package:thapasya/core/constants/app_urls.dart';
import '../model/attendance_model.dart';

class AttendanceService {
  Future<bool> submitAttendance(List<AttendanceRequestModel> data) async {
    try {
      for (var item in data) {
        await DioClient.dio.post(AppUrls.markAttendance, data: item.toJson());
      }

      return true;
    } catch (e) {
      print("ATTENDANCE API ERROR nee podaa mone dhinasha: $e");
      return false;
    }
  }
}
