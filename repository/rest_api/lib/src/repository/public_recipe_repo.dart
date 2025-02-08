import 'package:dio/dio.dart';

import '../../rest_api.dart';
import '../client.dart';

class PublicRecipeRepo extends Client {
  Future<Response> createRecipe({required RecipeDto recipeDto}) async {
    var dio = configureDio();

    final response = await dio.request(
      '/api/create_recipe_public/',
      data: recipeDto.toJson(),
      options: Options(method: 'POST'),
    );

    return response;
  }

  Future<Response> getRecipe() async {
    var dio = configureDio();

    final response = await dio.request(
      '/api/getRecipe_public',
      options: Options(method: 'GET'),
    );

    return response;
  }
}
