import 'package:auto_route/auto_route.dart';
import 'package:auto_route_generator/utils.dart';
import 'package:flutter_arch_starter/app/index.dart';
import 'package:flutter_arch_starter/app/routes/app_router.gr.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppRouter appRouter;

  setUp(
    () {
      appRouter = AppRouter();
    },
  );

  test('expect default route type is ${const RouteType.adaptive()}', () {
    expect(appRouter.defaultRouteType, const RouteType.adaptive());
  });

  group('routes', () {
    AutoRoute getRoute<T>() {
      final AutoRoute? route = appRouter.routes.firstWhereOrNull(
        (route) => route.name == T.toString(),
      );

      if (route == null) {
        expect(route, isNotNull, reason: '${T.runtimeType} not found in routes');
      }
      return route!;
    }

    test('expect has $ExampleRoute as initial route', () {
      final AutoRoute route = getRoute<ExampleRoute>();
      expect(route.page, ExampleRoute.page);
      expect(route.initial, isTrue);
    });
  });
}
