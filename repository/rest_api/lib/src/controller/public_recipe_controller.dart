import 'package:dio/dio.dart';
import 'package:rest_api/rest_api.dart';

import '../models/RecipeDTO.dart';
import '../repository/private_recipe_repo.dart';
import '../repository/public_recipe_repo.dart';

class PublicRecipeController {
  final PublicRecipeRepo recipeRepo;

  PublicRecipeController({
    required this.recipeRepo,
  });

  Future<void> createRecipe(
      {required RecipeDto recipeDto}) async {

        await recipeRepo.createRecipe(recipeDto: recipeDto);

  }

  Future<List<RecipeResponseModel>> getRecipe() async {
    Response response;

    response = await recipeRepo.getRecipe();

    return (response.data as List)
        .map((json) => RecipeResponseModel.fromJson(json))
        .toList();
  }
}
