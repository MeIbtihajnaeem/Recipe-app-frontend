import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:frontend/screens/common_screens/bloc/public_recipe_cubit.dart';
import 'package:frontend/screens/login_registration/bloc/login_register_cubit.dart';
import 'package:rest_api/rest_api.dart';

import '../routes/router.dart';

@RoutePage(name: 'AppRoute')
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // LocationTrackingController locationTrackingController =
    //     LocationTrackingController(LocationTrackingDataRepository());
    final AppRouter _appRouter = AppRouter();
    MediaQueryData windowData = MediaQueryData.fromView(View.of(context));
    windowData = windowData.copyWith(
      textScaler: const TextScaler.linear(1.0),
    );
    final AuthRepo authRepo = AuthRepo();
    final AuthController authController = AuthController(authRepo: authRepo);
    return MediaQuery(
      data: windowData,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginRegisterCubit(authController)),
          BlocProvider(
              create: (context) => PublicRecipeCubit(
                  PublicRecipeController(recipeRepo: PublicRecipeRepo()))),
        ],
        child: MaterialApp.router(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          // theme: theme,
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        ),
      ),
    );
  }
}
