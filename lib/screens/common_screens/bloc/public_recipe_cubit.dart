import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api/rest_api.dart';

part 'public_recipe_state.dart';

class PublicRecipeCubit extends Cubit<PublicRecipeState> {
  final PublicRecipeController controller;
  PublicRecipeCubit(this.controller) : super(PublicRecipeState.empty());

  Future<void> createRecipe(RecipeDto recipeDto) async {
    emit(state.copyWith(showError: false, error: ""));
    try {
      await controller.createRecipe(recipeDto: recipeDto);
      getRecipe();
    } catch (e) {
      emit(state.copyWith(error: e.toString(), showError: true));
    }
  }

  void getRecipe() async {
    try {
      emit(state.copyWith(showError: false, error: ""));
      List<RecipeResponseModel> model = await controller.getRecipe();
      emit(state.copyWith(recipeList: model));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), showError: true));
    }
  }
}
