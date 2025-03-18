import 'package:dio/dio.dart';
import 'package:librotech/src/core/http/app_interceptors.dart';

class ApiProvider {
  late Dio dio;

  ApiProvider() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.itbook.store/1.0/'));
    dio.interceptors.add(AppInterceptors());
  }
}
