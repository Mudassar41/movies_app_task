import 'package:dio/dio.dart';
import 'package:task/base/app_data.dart';
import 'package:task/utils/consts.dart';

/// The [BaseApi] class provides a base for making HTTP requests using Dio.
///
class BaseApi {
  Map<String, String> get headers => {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer ${AppData.instance.accessToken}",
      };
  final _dio = Dio(BaseOptions(baseUrl: Consts.baseUrl));

  Future<Response> getRequest({
    required String url,
    Map<String, String>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response;
    } catch (_) {
      rethrow;
    }
  }
}
