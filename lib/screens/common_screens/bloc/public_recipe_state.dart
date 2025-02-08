part of 'public_recipe_cubit.dart';

class PublicRecipeState extends Equatable {
  final PublicRecipeModel? recipeModel;
  final List<RecipeResponseModel> recipeList;
  final String error;
  final bool showError;

  const PublicRecipeState(
      {required this.recipeModel,
      required this.error,
      required this.showError,
      required this.recipeList});

  static PublicRecipeState empty() => const PublicRecipeState(
      recipeModel: null, error: "", showError: false, recipeList: []);

  PublicRecipeState copyWith(
          {PublicRecipeModel? recipeModel,
          String? error,
          bool? showError,
          List<RecipeResponseModel>? recipeList}) =>
      PublicRecipeState(
          recipeList: recipeList ?? this.recipeList,
          recipeModel: recipeModel ?? this.recipeModel,
          error: error ?? this.error,
          showError: showError ?? this.showError);

  @override
  List<Object?> get props => [recipeModel, recipeList, error, showError];
}
