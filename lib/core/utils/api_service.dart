import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> post({
    Map<String, String>? headers,
    required body,
    required String url,
    required String token,
    String? contentType,
  }) async {
    // Set default headers
    final defaultHeaders = {
      'Authorization': 'Bearer $token',
      'Content-Type': contentType ?? Headers.formUrlEncodedContentType,
    };

    // Merge default headers with any custom headers provided
    final combinedHeaders = {
      ...defaultHeaders,
      if (headers != null) ...headers,
    };

    var response = await dio.post(
      url,
      data: body,
      options: Options(
        headers: combinedHeaders,
      ),
    );

    return response;
  }
}
