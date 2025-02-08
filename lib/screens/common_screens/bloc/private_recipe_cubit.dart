import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api/rest_api.dart';

part 'private_recipe_state.dart';

class PrivateRecipeCubit extends Cubit<PrivateRecipeState> {
  final PrivateRecipeController controller;
  PrivateRecipeCubit(this.controller) : super(PrivateRecipeState.empty());

  void createRecipe(RecipeDto recipeDto) async {
    emit(state.copyWith(showError: false, error: ""));
    try {
      PrivateRecipeModel? model =
          await controller.createRecipe(recipeDto: recipeDto);
      emit(state.copyWith(recipeModel: model));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), showError: true));
    }
  }

  void getRecipe()async{
    try{
      emit(state.copyWith(showError: false, error: ""));
      List<RecipeResponseModel> model = await controller.getRecipe();
      emit(state.copyWith(recipeList: model));

    }catch(e){
      emit(state.copyWith(error: e.toString(), showError: true));

    }
  }
}
