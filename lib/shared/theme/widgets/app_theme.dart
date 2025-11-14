import 'package:flutter/material.dart';
import 'package:flutter_arch_starter/shared/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef AppThemeBuilder = Widget Function(
  BuildContext context,
  ThemeData theme,
);

class AppTheme extends StatefulWidget {
  const AppTheme({
    super.key,
    required this.builder,
  });

  final AppThemeBuilder builder;

  @override
  State<AppTheme> createState() => _AppThemeState();
}

class _AppThemeState extends State<AppTheme> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final brightness = MediaQuery.of(context).platformBrightness;

    context.read<ThemeBloc>().add(
          ThemeEvent.changeAppearance(brightness: brightness),
        );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
        context,
        context.watch<ThemeBloc>().state.map(
              light: (_) => lightTheme,
              dark: (_) => darkTheme,
            ));
  }
}
