import 'package:flutter/material.dart';
import 'package:rest_api/rest_api.dart';

class RecipesList extends StatelessWidget {
  final List<RecipeResponseModel> recipes;
  const RecipesList({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return Card(
          elevation: 8,
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [Colors.blueAccent.shade100, Colors.blueAccent.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.recipe,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Ingredients:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white70,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(recipe.ingredients.length, (i) {
                      return Text(
                        "- ${recipe.ingredients[i].ingredient}",
                        style: const TextStyle(color: Colors.white),
                      );
                    }),
                  ),
                  if (recipe.ingredients.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    const Text(
                      "Instructions:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      recipe.instructions ?? "No instructions provided.",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ]
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
