import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_bloc.freezed.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState.light()) {
    on<_ChangeAppearance>(_onChangeAppearance);
  }

  FutureOr<void> _onChangeAppearance(event, emit) {
    switch (event.brightness) {
      case Brightness.dark:
        emit(const ThemeState.dark());
      case Brightness.light:
        emit(const ThemeState.light());
    }
  }
}
