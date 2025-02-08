import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/app/routes/router.gr.dart';
import 'package:frontend/screens/login_registration/bloc/login_register_cubit.dart';

import '../common_screens/bloc/public_recipe_cubit.dart';
import '../common_screens/view/view_recipies_public.dart';
import '../common_screens/view/widgets/recipes_list.dart';

@RoutePage(name: 'HomeRoute')
class Home extends StatelessWidget {
  const Home({super.key});

  // final List<Map<String, dynamic>> recipes = const [
  //   {
  //     "id": 1,
  //     "recipe": "Chicken Biryani",
  //     "ingredients": [
  //       {"id": 1, "ingredient": "1 kg chicken"},
  //       {"id": 2, "ingredient": "2 cups rice"},
  //       {"id": 3, "ingredient": "Spices"},
  //       {"id": 4, "ingredient": "Yogurt"},
  //       {"id": 5, "ingredient": "Tomatoes"},
  //       {"id": 6, "ingredient": "Onions"}
  //     ],
  //     "instructions": "My Instructions"
  //   },
  //   {
  //     "id": 1,
  //     "recipe": "Chicken Biryani",
  //     "ingredients": [
  //       {"id": 1, "ingredient": "1 kg chicken"},
  //       {"id": 2, "ingredient": "2 cups rice"},
  //       {"id": 3, "ingredient": "Spices"},
  //       {"id": 4, "ingredient": "Yogurt"},
  //       {"id": 5, "ingredient": "Tomatoes"},
  //       {"id": 6, "ingredient": "Onions"}
  //     ],
  //     "instructions": "My Instructions"
  //   },
  //   {
  //     "id": 1,
  //     "recipe": "Chicken Biryani",
  //     "ingredients": [
  //       {"id": 1, "ingredient": "1 kg chicken"},
  //       {"id": 2, "ingredient": "2 cups rice"},
  //       {"id": 3, "ingredient": "Spices"},
  //       {"id": 4, "ingredient": "Yogurt"},
  //       {"id": 5, "ingredient": "Tomatoes"},
  //       {"id": 6, "ingredient": "Onions"}
  //     ],
  //     "instructions": "My Instructions"
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    context.read<PublicRecipeCubit>().getRecipe();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to Recipe App"),
        actions: [
          BlocBuilder<LoginRegisterCubit, LoginRegisterState>(
            buildWhen: (pre, nxt) => pre.user != nxt.user,
            builder: (context, state) {
              return state.user == null
                  ? TextButton(
                      onPressed: () =>
                          AutoRouter.of(context).pushNamed('/login'),
                      child: const Text("Login",
                          style: TextStyle(color: Colors.white)),
                    )
                  : TextButton(
                      onPressed: () => AutoRouter.of(context).replace(
                          CreateRecipeRoute(token: state.user?.token ?? "")),
                      child: const Text("Create Your Own Recipe",
                          style: TextStyle(color: Colors.white)),
                    );
            },
          ),
          BlocBuilder<LoginRegisterCubit, LoginRegisterState>(
            buildWhen: (pre, nxt) => pre.user != nxt.user,
            builder: (context, state) {
              return state.user == null
                  ? TextButton(
                      onPressed: () =>
                          AutoRouter.of(context).pushNamed('/register'),
                      child: const Text("Register",
                          style: TextStyle(color: Colors.white)),
                    )
                  : TextButton(
                      onPressed: () => AutoRouter.of(context).replace(
                          ViewRecipeRoute(token: state.user?.token ?? "")),
                      child: const Text("View Your Own Recipe",
                          style: TextStyle(color: Colors.white)),
                    );
            },
          ),
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.restaurant_menu,
                size: 100, color: Colors.blueAccent),
            const SizedBox(height: 20),
            const Text(
              "Welcome to the Recipe Management App",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () =>
                  AutoRouter.of(context).replace( const CreateRecipePublicRoute()),
              child: const Text("Create Public Recipe",
                  style: TextStyle(color: Colors.black)),
            ),
            const Expanded(
              child: ViewRecipeisBody(),
            ),
          ],
        ),
      ),
    );
  }
}
