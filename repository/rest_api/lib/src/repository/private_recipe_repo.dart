import 'package:dio/dio.dart';

import '../client.dart';
import '../models/RecipeDTO.dart';

class PrivateRecipeRepo extends Client {
  Future<Response> createRecipe(
      {required RecipeDto recipeDto, required String token}) async {
    var dio = configureDioAuth(token);

    final response = await dio.request(
      '/api/create_recipe',
      data: recipeDto.toJson(),
      options: Options(method: 'POST'),
    );

    return response;
  }

  Future<Response> getRecipe({required String token}) async {
    var dio = configureDioAuth(token);

    final response = await dio.request(
      '/api/get_recipe',
      options: Options(method: 'GET'),
    );

    return response;
  }
}
