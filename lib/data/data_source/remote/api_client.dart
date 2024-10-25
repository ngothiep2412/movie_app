import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/data_source/remote/api_constant.dart';
import 'package:movie_app/data/data_source/remote/api_exception.dart';

class ApiClient {
  late Dio dio;
  late BaseOptions baseOptions;

  ApiClient() {
    baseOptions = BaseOptions(
      baseUrl: ApiConstant.mainUrl,
    );
    dio = Dio(baseOptions);
  }

  Options options = Options();

  Future<Response> getRequest({
    required String path,
  }) async {
    try {
      options.headers = baseOptions.headers..addAll(ApiConstant.headers);

      debugPrint(
          "🚀======================API REQUEST==========================🚀");
      debugPrint("Request Url: ${baseOptions.baseUrl + path}");

      var response = await dio.get(path, options: options);
      debugPrint(
          "🔥======================API RESPONSE==========================🔥");

      debugPrint("Status code: ${response.statusCode}");
      debugPrint("DATA: ${response.data}");

      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.data);
        debugPrint(e.response!.headers.toString());
        debugPrint(e.response!.requestOptions.toString());
        throw ApiException(message: e.response!.statusMessage);
      } else {
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
        throw ApiException(message: e.message);
      }
    }
  }
}
