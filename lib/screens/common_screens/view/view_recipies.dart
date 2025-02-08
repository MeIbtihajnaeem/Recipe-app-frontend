import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api/rest_api.dart';

import '../bloc/private_recipe_cubit.dart';
import 'widgets/recipes_list.dart';

@RoutePage(name: 'ViewRecipeRoute')
class ViewRecipeis extends StatelessWidget {
  final String token;

  const ViewRecipeis({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrivateRecipeCubit(PrivateRecipeController(
          recipeRepo: PrivateRecipeRepo(), token: token)),
      child: const ViewRecipeisBody(),
    );
  }
}

class ViewRecipeisBody extends StatelessWidget {
  const ViewRecipeisBody({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PrivateRecipeCubit>().getRecipe();
    return BlocConsumer<PrivateRecipeCubit, PrivateRecipeState>(
      listener: (context, state) {
        if (state.showError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              duration: const Duration(seconds: 2)));
        }
      },
      builder: (context, state) {
        return BlocBuilder<PrivateRecipeCubit, PrivateRecipeState>(
          // buildWhen: (pre, nxt) =>
          //     pre.recipeList.length != nxt.recipeList.length,
          builder: (context, state) {
            return RecipesList(recipes: state.recipeList);
          },
        );
      },
    );
  }
}
