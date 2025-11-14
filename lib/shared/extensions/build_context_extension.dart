import 'package:flutter/material.dart';
import 'package:flutter_arch_starter/l10n/generated/app_localizations.dart';
import 'package:flutter_arch_starter/shared/index.dart';

extension BuildContextExtension on BuildContext {
  IRouter get router => getIt<IRouter>();

  AppLocalizations get l10n {
    try {
      return AppLocalizations.of(this)!;
    } on Exception catch (_) {
      rethrow;
    }
  }
}
