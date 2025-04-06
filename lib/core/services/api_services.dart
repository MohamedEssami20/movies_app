import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/api_server_errors.dart';
import 'package:movies_app/core/utils/api_end_points.dart';

import '../errors/failure.dart';

class ApiServices {
  static final Dio _dio = Dio();

   Future<Map<String, dynamic>> get(String url) async {
    try {
      Response response = await _dio.get(
        ApiEndPoints.apiKey + url,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer ${ApiEndPoints.apiKey}",
          },
        ),
      );
      return response.data;
    } on DioException catch (error) {
      ApiServerErrors.fromDioError(error);
    } catch (error) {
      throw Failure("there was unkown error, try later.");
    }
    throw Failure("there was unkown error!, try later.");
  }

  Future<Response> post(String url, {data}) async {
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
