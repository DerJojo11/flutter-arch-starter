// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ThemeEvent {
  Brightness get brightness;

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ThemeEventCopyWith<ThemeEvent> get copyWith =>
      _$ThemeEventCopyWithImpl<ThemeEvent>(this as ThemeEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ThemeEvent &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, brightness);

  @override
  String toString() {
    return 'ThemeEvent(brightness: $brightness)';
  }
}

/// @nodoc
abstract mixin class $ThemeEventCopyWith<$Res> {
  factory $ThemeEventCopyWith(
          ThemeEvent value, $Res Function(ThemeEvent) _then) =
      _$ThemeEventCopyWithImpl;
  @useResult
  $Res call({Brightness brightness});
}

/// @nodoc
class _$ThemeEventCopyWithImpl<$Res> implements $ThemeEventCopyWith<$Res> {
  _$ThemeEventCopyWithImpl(this._self, this._then);

  final ThemeEvent _self;
  final $Res Function(ThemeEvent) _then;

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brightness = null,
  }) {
    return _then(_self.copyWith(
      brightness: null == brightness
          ? _self.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// Adds pattern-matching-related methods to [ThemeEvent].
extension ThemeEventPatterns on ThemeEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeAppearance value)? changeAppearance,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChangeAppearance() when changeAppearance != null:
        return changeAppearance(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeAppearance value) changeAppearance,
  }) {
    final _that = this;
    switch (_that) {
      case _ChangeAppearance():
        return changeAppearance(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeAppearance value)? changeAppearance,
  }) {
    final _that = this;
    switch (_that) {
      case _ChangeAppearance() when changeAppearance != null:
        return changeAppearance(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Brightness brightness)? changeAppearance,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChangeAppearance() when changeAppearance != null:
        return changeAppearance(_that.brightness);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Brightness brightness) changeAppearance,
  }) {
    final _that = this;
    switch (_that) {
      case _ChangeAppearance():
        return changeAppearance(_that.brightness);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Brightness brightness)? changeAppearance,
  }) {
    final _that = this;
    switch (_that) {
      case _ChangeAppearance() when changeAppearance != null:
        return changeAppearance(_that.brightness);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChangeAppearance implements ThemeEvent {
  const _ChangeAppearance({required this.brightness});

  @override
  final Brightness brightness;

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChangeAppearanceCopyWith<_ChangeAppearance> get copyWith =>
      __$ChangeAppearanceCopyWithImpl<_ChangeAppearance>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeAppearance &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @override
  int get hashCode => Object.hash(runtimeType, brightness);

  @override
  String toString() {
    return 'ThemeEvent.changeAppearance(brightness: $brightness)';
  }
}

/// @nodoc
abstract mixin class _$ChangeAppearanceCopyWith<$Res>
    implements $ThemeEventCopyWith<$Res> {
  factory _$ChangeAppearanceCopyWith(
          _ChangeAppearance value, $Res Function(_ChangeAppearance) _then) =
      __$ChangeAppearanceCopyWithImpl;
  @override
  @useResult
  $Res call({Brightness brightness});
}

/// @nodoc
class __$ChangeAppearanceCopyWithImpl<$Res>
    implements _$ChangeAppearanceCopyWith<$Res> {
  __$ChangeAppearanceCopyWithImpl(this._self, this._then);

  final _ChangeAppearance _self;
  final $Res Function(_ChangeAppearance) _then;

  /// Create a copy of ThemeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? brightness = null,
  }) {
    return _then(_ChangeAppearance(
      brightness: null == brightness
          ? _self.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as Brightness,
    ));
  }
}

/// @nodoc
mixin _$ThemeState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ThemeState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ThemeState()';
  }
}

/// @nodoc
class $ThemeStateCopyWith<$Res> {
  $ThemeStateCopyWith(ThemeState _, $Res Function(ThemeState) __);
}

/// Adds pattern-matching-related methods to [ThemeState].
extension ThemeStatePatterns on ThemeState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LightTheme value)? light,
    TResult Function(_DarkTheme value)? dark,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LightTheme() when light != null:
        return light(_that);
      case _DarkTheme() when dark != null:
        return dark(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LightTheme value) light,
    required TResult Function(_DarkTheme value) dark,
  }) {
    final _that = this;
    switch (_that) {
      case _LightTheme():
        return light(_that);
      case _DarkTheme():
        return dark(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LightTheme value)? light,
    TResult? Function(_DarkTheme value)? dark,
  }) {
    final _that = this;
    switch (_that) {
      case _LightTheme() when light != null:
        return light(_that);
      case _DarkTheme() when dark != null:
        return dark(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? light,
    TResult Function()? dark,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LightTheme() when light != null:
        return light();
      case _DarkTheme() when dark != null:
        return dark();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() light,
    required TResult Function() dark,
  }) {
    final _that = this;
    switch (_that) {
      case _LightTheme():
        return light();
      case _DarkTheme():
        return dark();
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? light,
    TResult? Function()? dark,
  }) {
    final _that = this;
    switch (_that) {
      case _LightTheme() when light != null:
        return light();
      case _DarkTheme() when dark != null:
        return dark();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LightTheme implements ThemeState {
  const _LightTheme();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LightTheme);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ThemeState.light()';
  }
}

/// @nodoc

class _DarkTheme implements ThemeState {
  const _DarkTheme();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _DarkTheme);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ThemeState.dark()';
  }
}

// dart format on
