import 'package:bau_recht/l10n/generated/app_localizations.dart';
import 'package:bau_recht/shared/get_it.dart';
import 'package:bau_recht/shared/router/i_router.dart';
import 'package:flutter/material.dart';

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
