import 'package:dio/dio.dart';
import 'package:rest_api/src/client.dart';

class AuthRepo extends Client {
  Future<Response> loginUser(
      {required String userName,
      required String email,
      required String password}) async {
    var dio = configureDio();

    final response = await dio.request(
      '/api/login',
      data: {"username": userName, "email": email, "password": password},
      options: Options(method: 'POST'),
    );

    return response;
  }

  Future<Response> registerUserUser(
      {required String userName,
      required String email,
      required String password}) async {
    var dio = configureDio();

    final response = await dio.request(
      '/api/register',
      data: {"username": userName, "email": email, "password": password},
      options: Options(method: 'POST'),
    );

    return response;
  }
}
