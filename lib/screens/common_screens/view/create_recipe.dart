import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api/rest_api.dart';

import '../bloc/private_recipe_cubit.dart';

@RoutePage(name: 'CreateRecipeRoute')
class CreateRecipePage extends StatelessWidget {
  final String token;

  const CreateRecipePage({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrivateRecipeCubit(
          PrivateRecipeController(recipeRepo: PrivateRecipeRepo(), token: token)),
      child: const CreateRecipePageBody(),
    );
  }
}

class CreateRecipePageBody extends StatelessWidget {
  const CreateRecipePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController recipeController = TextEditingController();
    final TextEditingController instructionsController =
        TextEditingController();
    final TextEditingController ingredientsController = TextEditingController();

    return BlocListener<PrivateRecipeCubit, PrivateRecipeState>(
      listener: (context, state) {
        if (state.showError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              duration: const Duration(seconds: 2)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create Recipe"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: recipeController,
                decoration: InputDecoration(
                  labelText: "Recipe Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: instructionsController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "Instructions",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: ingredientsController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Ingredients (comma separated)",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    var recipeDto = RecipeDto(
                        recipe: recipeController.text,
                        ingredients: ingredientsController.text,
                        instructions: instructionsController.text);
                    context.read<PrivateRecipeCubit>().createRecipe(recipeDto);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child:
                      const Text("Save Recipe", style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
