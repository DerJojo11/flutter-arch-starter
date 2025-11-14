// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter_arch_starter/features/example/example_details_page.dart'
    as _i1;
import 'package:flutter_arch_starter/features/example/example_page.dart' as _i2;

/// generated route for
/// [_i1.ExampleDetailsPage]
class ExampleDetailsRoute extends _i3.PageRouteInfo<ExampleDetailsRouteArgs> {
  ExampleDetailsRoute({
    _i4.Key? key,
    required String id,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          ExampleDetailsRoute.name,
          args: ExampleDetailsRouteArgs(key: key, id: id),
          initialChildren: children,
        );

  static const String name = 'ExampleDetailsRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExampleDetailsRouteArgs>();
      return _i1.ExampleDetailsPage(key: args.key, id: args.id);
    },
  );
}

class ExampleDetailsRouteArgs {
  const ExampleDetailsRouteArgs({this.key, required this.id});

  final _i4.Key? key;

  final String id;

  @override
  String toString() {
    return 'ExampleDetailsRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ExampleDetailsRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i2.ExamplePage]
class ExampleRoute extends _i3.PageRouteInfo<void> {
  const ExampleRoute({List<_i3.PageRouteInfo>? children})
      : super(ExampleRoute.name, initialChildren: children);

  static const String name = 'ExampleRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.ExamplePage();
    },
  );
}
