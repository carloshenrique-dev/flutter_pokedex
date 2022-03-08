import 'package:flutter_pokedex/core/services/api_service.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<Dio>(Dio(), permanent: true);
    Get.put<ApiService>(ApiService(dio: Get.find()), permanent: true);
  }
}
