import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/api_end_points.dart';

class ApiServices {
  static final Dio _dio = Dio();

  static Future<Response> get(String url) async {
    return await _dio.get(
      url,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer ${ApiEndPoints.apiKey}",
        },
      ),
    );
  }

  static Future<Response> post(String url, {data}) async {
    return await _dio.post(
      url,
      data: data,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer ${ApiEndPoints.apiKey}",
        },
      ),
    );
  }
}
