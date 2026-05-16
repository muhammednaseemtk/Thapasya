import 'package:flutter/foundation.dart';
import 'package:thapasya/core/constants/app_urls.dart';
import 'package:thapasya/core/network/dio_client.dart';

class AuthLogoutService {
  Future<bool> logoutUser() async {
    try {
      final response = await DioClient.dio.post(AppUrls.logout);

      debugPrint("LOGOUT STATUS : ${response.statusCode}");
      debugPrint("LOGOUT RESPONSE : ${response.data}");

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      debugPrint("LOGOUT ERROR : $e");
      return false;
    }
  }
}
