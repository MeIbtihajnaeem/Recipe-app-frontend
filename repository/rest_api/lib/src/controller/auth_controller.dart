import 'package:dio/dio.dart';
import 'package:rest_api/rest_api.dart';

class AuthController {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});
  Future<UserModel> loginOrRegister(
      {required String userName,
      required String email,
      required String password,
      bool login = false}) async {
    Response response;
    if (login) {
      response = await authRepo.loginUser(
          userName: userName, email: email, password: password);
    } else {
      response = await authRepo.registerUserUser(
          userName: userName, email: email, password: password);
    }
    if (response.statusCode == 200) {
      var data = response.data;
      if (data["detail"] != null) {
        throw "Failed to log in no user found!";
      } else if (data["username"] != null) {
        throw "A user with that username already exists.!";
      }
      return UserModel.fromJson(response.data);
    }
    throw "Failed to perform this action";
  }
}
