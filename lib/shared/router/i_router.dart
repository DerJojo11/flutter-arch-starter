/// An interface for routers to implement.
abstract interface class IRouter {
  /// Pushes a new route onto the navigation stack.
  Future<T?> push<T extends Object?>(Object route);

  /// Replaces the current route with a new one.
  Future<T?> replace<T extends Object?>(Object route);

  /// Pops the current route off the navigation stack.
  Future<bool> maybePop<T extends Object?>([T? result]);
}
