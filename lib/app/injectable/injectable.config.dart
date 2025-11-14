// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../shared/router/i_router.dart' as _i64;
import '../routes/app_router.dart' as _i629;
import '../routes/app_router_adapter.dart' as _i118;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i629.AppRouter>(() => _i629.AppRouter());
    gh.lazySingleton<_i64.IRouter>(
        () => _i118.AppRouterAdapter(gh<_i629.AppRouter>()));
    return this;
  }
}
