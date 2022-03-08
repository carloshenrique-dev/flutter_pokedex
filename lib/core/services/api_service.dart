import 'dart:developer';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dioInstance;
  ApiService({
    required Dio dio,
  }) : dioInstance = dio;

  Dio createDio() {
    Dio dio = dioInstance;
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 5000;
    //dio.options.baseUrl = 'https://pokeapi.co/api/v2/pokemon';
    return dio;
  }

  Future<Response> get({required String path}) async {
    try {
      return await dioInstance.get(path);
    } on DioError catch (e) {
      log('[Dio Helper - Get] Exception => ' + e.message);
      rethrow;
    }
  }
}
