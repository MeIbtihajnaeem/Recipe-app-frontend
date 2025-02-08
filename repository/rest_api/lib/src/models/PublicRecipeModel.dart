
class PublicRecipeModel {
  int id;
  String recipe;
  List<PublicIngredient> ingredients;
  String instructions;

  PublicRecipeModel({
    required this.id,
    required this.recipe,
    required this.ingredients,
    required this.instructions,
  });

  PublicRecipeModel copyWith({
    int? id,
    String? recipe,
    List<PublicIngredient>? ingredients,
    String? instructions,
  }) =>
      PublicRecipeModel(
        id: id ?? this.id,
        recipe: recipe ?? this.recipe,
        ingredients: ingredients ?? this.ingredients,
        instructions: instructions ?? this.instructions,
      );

  factory PublicRecipeModel.fromJson(Map<String, dynamic> json) => PublicRecipeModel(
    id: json["id"]??0,
    recipe: json["recipe"]??"",
    ingredients: List<PublicIngredient>.from(json["ingredients"].map((x) => PublicIngredient.fromJson(x))),
    instructions: json["instructions"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "recipe": recipe,
    "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
    "instructions": instructions,
  };
}

class PublicIngredient {
  int id;
  String ingredient;

  PublicIngredient({
    required this.id,
    required this.ingredient,
  });

  PublicIngredient copyWith({
    int? id,
    String? ingredient,
  }) =>
      PublicIngredient(
        id: id ?? this.id,
        ingredient: ingredient ?? this.ingredient,
      );

  factory PublicIngredient.fromJson(Map<String, dynamic> json) => PublicIngredient(
    id: json["id"]??"",
    ingredient: json["ingredient"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ingredient": ingredient,
  };
}
