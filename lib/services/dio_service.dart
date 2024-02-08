import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class DioService {
  Dio dio = Dio();
  Future<dynamic> getMethode({required String url}) async {
    dio.options.headers['content-type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((response) {
      return response;
    }).catchError((error) async {
      if (error is DioException) {
        log(error.response.toString());
      }
      return await error;
    });
  }

  Future<dynamic> postMethode(
      {required String url, required Map<String, dynamic> map}) async {
    dio.options.headers['content-type'] = 'application/json';
    var token = GetStorage().read('token');
    if (token != null) {
      dio.options.headers['Authorization'] = token;
    }

    return await dio
        .post(url,
            data: FormData.fromMap(map),
            options: Options(responseType: ResponseType.json, method: 'POST'))
        .then((response) {
      return response;
    }).catchError((error) async {
      if (error is DioException) {
        log(error.response.toString());
      }
      return await error;
    });
  }
}
