class PrivateRecipeModel {
  Recipe recipe;
  List<Ingredient> ingredients;

  PrivateRecipeModel({
    required this.recipe,
    required this.ingredients,
  });

  PrivateRecipeModel copyWith({
    Recipe? recipe,
    List<Ingredient>? ingredients,
  }) =>
      PrivateRecipeModel(
        recipe: recipe ?? this.recipe,
        ingredients: ingredients ?? this.ingredients,
      );

  factory PrivateRecipeModel.fromJson(Map<String, dynamic> json) =>
      PrivateRecipeModel(
        recipe: Recipe.fromJson(json["recipe"]),
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recipe": recipe.toJson(),
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
      };
}

class Ingredient {
  String ingredient;

  Ingredient({
    required this.ingredient,
  });

  Ingredient copyWith({
    String? ingredient,
  }) =>
      Ingredient(
        ingredient: ingredient ?? this.ingredient,
      );

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        ingredient: json["ingredient"]??"",
      );

  Map<String, dynamic> toJson() => {
        "ingredient": ingredient,
      };
}

class Recipe {
  int id;
  String instructions;
  String recipe;
  DateTime created;
  int user;

  Recipe({
    required this.id,
    required this.instructions,
    required this.recipe,
    required this.created,
    required this.user,
  });

  Recipe copyWith({
    int? id,
    String? instructions,
    String? recipe,
    DateTime? created,
    int? user,
  }) =>
      Recipe(
        id: id ?? this.id,
        instructions: instructions ?? this.instructions,
        recipe: recipe ?? this.recipe,
        created: created ?? this.created,
        user: user ?? this.user,
      );

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json["id"]??"",
        instructions: json["instructions"]??"",
        recipe: json["recipe"]??"",
        created: DateTime.parse(json["created"]),
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "instructions": instructions,
        "recipe": recipe,
        "created": created.toIso8601String(),
        "user": user,
      };
}
