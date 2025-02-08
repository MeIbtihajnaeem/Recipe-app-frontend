class RecipeDto {
  String recipe;
  String instructions;
  String ingredients;

  RecipeDto({
    required this.recipe,
    required this.instructions,
    required this.ingredients,
  });

  RecipeDto copyWith({
    String? recipe,
    String? instructions,
    String? ingredients,
  }) =>
      RecipeDto(
        recipe: recipe ?? this.recipe,
        instructions: instructions ?? this.instructions,
        ingredients: ingredients ?? this.ingredients,
      );

  factory RecipeDto.fromJson(Map<String, dynamic> json) => RecipeDto(
        recipe: json["recipe"],
        instructions: json["instructions"],
        ingredients: json["ingredients"],
      );

  Map<String, dynamic> toJson() => {
        "recipe": recipe,
        "instructions": instructions,
        "ingredients": ingredients.split(",").map((e) => e.trim()).toList(),
      };
}
