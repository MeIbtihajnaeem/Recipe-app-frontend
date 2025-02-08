// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:frontend/app/view/app.dart' as _i6;
import 'package:frontend/screens/common_screens/view/create_recipe.dart' as _i1;
import 'package:frontend/screens/common_screens/view/create_recipe_public.dart'
    as _i2;
import 'package:frontend/screens/common_screens/view/view_recipies.dart' as _i7;
import 'package:frontend/screens/common_screens/view/view_recipies_public.dart'
    as _i8;
import 'package:frontend/screens/home/home.dart' as _i3;
import 'package:frontend/screens/login_registration/login.dart' as _i4;
import 'package:frontend/screens/login_registration/register.dart' as _i5;

/// generated route for
/// [_i1.CreateRecipePage]
class CreateRecipeRoute extends _i9.PageRouteInfo<CreateRecipeRouteArgs> {
  CreateRecipeRoute({
    _i10.Key? key,
    required String token,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          CreateRecipeRoute.name,
          args: CreateRecipeRouteArgs(
            key: key,
            token: token,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateRecipeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateRecipeRouteArgs>();
      return _i1.CreateRecipePage(
        key: args.key,
        token: args.token,
      );
    },
  );
}

class CreateRecipeRouteArgs {
  const CreateRecipeRouteArgs({
    this.key,
    required this.token,
  });

  final _i10.Key? key;

  final String token;

  @override
  String toString() {
    return 'CreateRecipeRouteArgs{key: $key, token: $token}';
  }
}

/// generated route for
/// [_i2.CreateRecipePage]
class CreateRecipePublicRoute extends _i9.PageRouteInfo<void> {
  const CreateRecipePublicRoute({List<_i9.PageRouteInfo>? children})
      : super(
          CreateRecipePublicRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateRecipePublicRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.CreateRecipePage();
    },
  );
}

/// generated route for
/// [_i3.Home]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.Home();
    },
  );
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginPage();
    },
  );
}

/// generated route for
/// [_i5.LoginPage]
class RegisterRoute extends _i9.PageRouteInfo<void> {
  const RegisterRoute({List<_i9.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginPage();
    },
  );
}

/// generated route for
/// [_i6.MyApp]
class AppRoute extends _i9.PageRouteInfo<void> {
  const AppRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AppRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.MyApp();
    },
  );
}

/// generated route for
/// [_i7.ViewRecipeis]
class ViewRecipeRoute extends _i9.PageRouteInfo<ViewRecipeRouteArgs> {
  ViewRecipeRoute({
    _i10.Key? key,
    required String token,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ViewRecipeRoute.name,
          args: ViewRecipeRouteArgs(
            key: key,
            token: token,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewRecipeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ViewRecipeRouteArgs>();
      return _i7.ViewRecipeis(
        key: args.key,
        token: args.token,
      );
    },
  );
}

class ViewRecipeRouteArgs {
  const ViewRecipeRouteArgs({
    this.key,
    required this.token,
  });

  final _i10.Key? key;

  final String token;

  @override
  String toString() {
    return 'ViewRecipeRouteArgs{key: $key, token: $token}';
  }
}

/// generated route for
/// [_i8.ViewRecipeis]
class ViewRecipePublicRoute extends _i9.PageRouteInfo<void> {
  const ViewRecipePublicRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ViewRecipePublicRoute.name,
          initialChildren: children,
        );

  static const String name = 'ViewRecipePublicRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.ViewRecipeis();
    },
  );
}
