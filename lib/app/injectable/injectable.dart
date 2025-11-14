// Ignore covergare for this file, since it is generated code.
// coverage:ignore-file

import 'package:flutter_arch_starter/shared/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable.config.dart';

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();
