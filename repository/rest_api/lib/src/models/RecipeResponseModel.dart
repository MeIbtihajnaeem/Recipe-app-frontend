class RecipeResponseModel {
  int? id;
  String recipe;
  String? instructions;
  List<IngredientModel> ingredients;

  RecipeResponseModel({
    required this.id,
    required this.recipe,
    required this.instructions,
    required this.ingredients,
  });

  RecipeResponseModel copyWith({
    int? id,
    String? recipe,
    String? instructions,
    List<IngredientModel>? ingredients,
  }) =>
      RecipeResponseModel(
        id: id ?? this.id,
        recipe: recipe ?? this.recipe,
        instructions: instructions ?? this.instructions,
        ingredients: ingredients ?? this.ingredients,
      );

  factory RecipeResponseModel.fromJson(Map<String, dynamic> json) =>
      RecipeResponseModel(
        id: json["id"],
        recipe: json["recipe"],
        instructions: json["instructions"],
        ingredients: List<IngredientModel>.from(
            json["ingredients"].map((x) => IngredientModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "recipe": recipe,
        "instructions": instructions,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
      };
}

class IngredientModel {
  int? id;
  String ingredient;

  IngredientModel({
    required this.id,
    required this.ingredient,
  });

  IngredientModel copyWith({
    int? id,
    String? ingredient,
  }) =>
      IngredientModel(
        id: id ?? this.id,
        ingredient: ingredient ?? this.ingredient,
      );

  factory IngredientModel.fromJson(Map<String, dynamic> json) => IngredientModel(
        id: json["id"],
        ingredient: json["ingredient"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ingredient": ingredient,
      };
}
