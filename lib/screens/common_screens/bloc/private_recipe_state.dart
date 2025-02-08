part of 'private_recipe_cubit.dart';

class PrivateRecipeState extends Equatable {
  final PrivateRecipeModel? recipeModel;
  final List<RecipeResponseModel> recipeList;
  final String error;
  final bool showError;

  const PrivateRecipeState({required this.recipeModel,
    required this.error,
    required this.showError, required this.recipeList});

  static PrivateRecipeState empty() =>
      const PrivateRecipeState(
          recipeModel: null, error: "", showError: false, recipeList: []);

  PrivateRecipeState copyWith({PrivateRecipeModel? recipeModel,
    String? error,
    bool? showError, List<RecipeResponseModel>? recipeList}) =>
      PrivateRecipeState(
          recipeList: recipeList ?? this.recipeList,
          recipeModel: recipeModel ?? this.recipeModel,
          error: error ?? this.error,
          showError: showError ?? this.showError);

  @override
  List<Object?> get props => [recipeModel, recipeList, error, showError];
}
