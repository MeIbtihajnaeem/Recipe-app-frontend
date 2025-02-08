import 'package:auto_route/auto_route.dart';
import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: "/", initial: true),

        AutoRoute(page: LoginRoute.page, path: "/login"),
        AutoRoute(page: RegisterRoute.page, path: "/register"),
        AutoRoute(page: CreateRecipeRoute.page, path: "/create_recipe"),
        AutoRoute(page: ViewRecipeRoute.page, path: "/view_recipies"),
        AutoRoute(
            page: ViewRecipePublicRoute.page, path: "/view_recipies_public"),
        AutoRoute(
            page: CreateRecipePublicRoute.page, path: "/view_recipies_public"),
        // AutoRoute(page: SplashRoute.page, path: "/", initial: true),
        // AutoRoute(page: EnableLocationRoute.page),
        // AutoRoute(page: SelectOriginScreenRoute.page),
        // AutoRoute(page: SelectDestinationScreenRoute.page),
        //
        // AutoRoute(page: ShowMapWithOriginRoute.page),
        // AutoRoute(page: ShowPolyLinesBetweenTwoPointsRoute.page),
        // AutoRoute(page: CompleteBookingFormScreenRoute.page),
        // // AutoRoute(page: OTPScreenRoute.page),
        // AutoRoute(page: HomeScreenRoute.page, guards: [authGuard])
      ];
}
