import 'package:dio/dio.dart';
import 'package:rest_api/rest_api.dart';

import '../models/RecipeDTO.dart';
import '../repository/private_recipe_repo.dart';

class PrivateRecipeController {
  final String token;
  final PrivateRecipeRepo recipeRepo;

  PrivateRecipeController({
    required this.token,
    required this.recipeRepo,
  });

  Future<PrivateRecipeModel> createRecipe(
      {required RecipeDto recipeDto}) async {
    Response response;

    response =
        await recipeRepo.createRecipe(recipeDto: recipeDto, token: token);

    return PrivateRecipeModel.fromJson(response.data);
  }

  Future<List<RecipeResponseModel>> getRecipe() async {
    Response response;

    response = await recipeRepo.getRecipe(token: token);

    return (response.data as List)
        .map((json) => RecipeResponseModel.fromJson(json))
        .toList();
  }
}
