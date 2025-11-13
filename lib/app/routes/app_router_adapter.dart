import 'package:auto_route/auto_route.dart';
import 'package:bau_recht/app/routes/app_router.dart';
import 'package:bau_recht/shared/router/i_router.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IRouter)
class AppRouterAdapter implements IRouter {
  AppRouterAdapter(this._appRouter);

  final AppRouter _appRouter;

  @override
  Future<T?> push<T extends Object?>(Object route) {
    return _appRouter.push(_guardRoute(route));
  }

  @override
  Future<bool> maybePop<T extends Object?>([T? result]) {
    return _appRouter.maybePop(result);
  }

  @override
  Future<T?> replace<T extends Object?>(Object route) {
    return _appRouter.replace(_guardRoute(route));
  }

  PageRouteInfo<T> _guardRoute<T extends Object?>(Object route) {
    if (route is PageRouteInfo<T>) {
      return route;
    }
    throw UnimplementedError('The provided route is not of type PageRouteInfo<T>');
  }
}
