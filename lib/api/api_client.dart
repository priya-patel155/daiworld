import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'http://203.187.204.211:82/api/',
    // connectTimeout: 5000,
    // receiveTimeout: 3000,
  ));
}
