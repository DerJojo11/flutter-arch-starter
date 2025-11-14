import 'package:auto_route/auto_route.dart';
import 'package:flutter_arch_starter/app/routes/app_router.gr.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ExampleRoute.page, initial: true),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
