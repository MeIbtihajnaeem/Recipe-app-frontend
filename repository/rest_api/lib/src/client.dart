import 'package:dio/dio.dart';

class Client {
   static const String baseUrl = 'http://127.0.0.1:8000';
   Dio configureDio() {
    var dio = Dio();
    // Set default configs
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = Duration(seconds: 5);
    dio.options.receiveTimeout = Duration(seconds: 3);

    return dio;
  }


   Dio configureDioAuth(String token) {

     var dio = Dio();
     // Set default configs
     dio.options.headers['Authorization'] = 'token $token';
     dio.options.baseUrl = baseUrl;
     dio.options.connectTimeout = Duration(seconds: 5);
     dio.options.receiveTimeout = Duration(seconds: 3);

     return dio;
   }
}
