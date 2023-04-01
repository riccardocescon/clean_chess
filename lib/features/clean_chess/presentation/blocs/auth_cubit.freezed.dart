// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() logged,
    required TResult Function() notLogged,
    required TResult Function() loading,
    required TResult Function(Failure error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? logged,
    TResult? Function()? notLogged,
    TResult? Function()? loading,
    TResult? Function(Failure error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? logged,
    TResult Function()? notLogged,
    TResult Function()? loading,
    TResult Function(Failure error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAuthStats value) initial,
    required TResult Function(_LoggedAuthStats value) logged,
    required TResult Function(_NotLoggedAuthStats value) notLogged,
    required TResult Function(_LoadingAuthStats value) loading,
    required TResult Function(_ErrorAuthStats value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialAuthStats value)? initial,
    TResult? Function(_LoggedAuthStats value)? logged,
    TResult? Function(_NotLoggedAuthStats value)? notLogged,
    TResult? Function(_LoadingAuthStats value)? loading,
    TResult? Function(_ErrorAuthStats value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAuthStats value)? initial,
    TResult Function(_LoggedAuthStats value)? logged,
    TResult Function(_NotLoggedAuthStats value)? notLogged,
    TResult Function(_LoadingAuthStats value)? loading,
    TResult Function(_ErrorAuthStats value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialAuthStatsCopyWith<$Res> {
  factory _$$_InitialAuthStatsCopyWith(
          _$_InitialAuthStats value, $Res Function(_$_InitialAuthStats) then) =
      __$$_InitialAuthStatsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialAuthStatsCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_InitialAuthStats>
    implements _$$_InitialAuthStatsCopyWith<$Res> {
  __$$_InitialAuthStatsCopyWithImpl(
      _$_InitialAuthStats _value, $Res Function(_$_InitialAuthStats) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InitialAuthStats implements _InitialAuthStats {
  _$_InitialAuthStats();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InitialAuthStats);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() logged,
    required TResult Function() notLogged,
    required TResult Function() loading,
    required TResult Function(Failure error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? logged,
    TResult? Function()? notLogged,
    TResult? Function()? loading,
    TResult? Function(Failure error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? logged,
    TResult Function()? notLogged,
    TResult Function()? loading,
    TResult Function(Failure error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAuthStats value) initial,
    required TResult Function(_LoggedAuthStats value) logged,
    required TResult Function(_NotLoggedAuthStats value) notLogged,
    required TResult Function(_LoadingAuthStats value) loading,
    required TResult Function(_ErrorAuthStats value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialAuthStats value)? initial,
    TResult? Function(_LoggedAuthStats value)? logged,
    TResult? Function(_NotLoggedAuthStats value)? notLogged,
    TResult? Function(_LoadingAuthStats value)? loading,
    TResult? Function(_ErrorAuthStats value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAuthStats value)? initial,
    TResult Function(_LoggedAuthStats value)? logged,
    TResult Function(_NotLoggedAuthStats value)? notLogged,
    TResult Function(_LoadingAuthStats value)? loading,
    TResult Function(_ErrorAuthStats value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialAuthStats implements AuthState {
  factory _InitialAuthStats() = _$_InitialAuthStats;
}

/// @nodoc
abstract class _$$_LoggedAuthStatsCopyWith<$Res> {
  factory _$$_LoggedAuthStatsCopyWith(
          _$_LoggedAuthStats value, $Res Function(_$_LoggedAuthStats) then) =
      __$$_LoggedAuthStatsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoggedAuthStatsCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_LoggedAuthStats>
    implements _$$_LoggedAuthStatsCopyWith<$Res> {
  __$$_LoggedAuthStatsCopyWithImpl(
      _$_LoggedAuthStats _value, $Res Function(_$_LoggedAuthStats) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoggedAuthStats implements _LoggedAuthStats {
  _$_LoggedAuthStats();

  @override
  String toString() {
    return 'AuthState.logged()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoggedAuthStats);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() logged,
    required TResult Function() notLogged,
    required TResult Function() loading,
    required TResult Function(Failure error) error,
  }) {
    return logged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? logged,
    TResult? Function()? notLogged,
    TResult? Function()? loading,
    TResult? Function(Failure error)? error,
  }) {
    return logged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? logged,
    TResult Function()? notLogged,
    TResult Function()? loading,
    TResult Function(Failure error)? error,
    required TResult orElse(),
  }) {
    if (logged != null) {
      return logged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAuthStats value) initial,
    required TResult Function(_LoggedAuthStats value) logged,
    required TResult Function(_NotLoggedAuthStats value) notLogged,
    required TResult Function(_LoadingAuthStats value) loading,
    required TResult Function(_ErrorAuthStats value) error,
  }) {
    return logged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialAuthStats value)? initial,
    TResult? Function(_LoggedAuthStats value)? logged,
    TResult? Function(_NotLoggedAuthStats value)? notLogged,
    TResult? Function(_LoadingAuthStats value)? loading,
    TResult? Function(_ErrorAuthStats value)? error,
  }) {
    return logged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAuthStats value)? initial,
    TResult Function(_LoggedAuthStats value)? logged,
    TResult Function(_NotLoggedAuthStats value)? notLogged,
    TResult Function(_LoadingAuthStats value)? loading,
    TResult Function(_ErrorAuthStats value)? error,
    required TResult orElse(),
  }) {
    if (logged != null) {
      return logged(this);
    }
    return orElse();
  }
}

abstract class _LoggedAuthStats implements AuthState {
  factory _LoggedAuthStats() = _$_LoggedAuthStats;
}

/// @nodoc
abstract class _$$_NotLoggedAuthStatsCopyWith<$Res> {
  factory _$$_NotLoggedAuthStatsCopyWith(_$_NotLoggedAuthStats value,
          $Res Function(_$_NotLoggedAuthStats) then) =
      __$$_NotLoggedAuthStatsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NotLoggedAuthStatsCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_NotLoggedAuthStats>
    implements _$$_NotLoggedAuthStatsCopyWith<$Res> {
  __$$_NotLoggedAuthStatsCopyWithImpl(
      _$_NotLoggedAuthStats _value, $Res Function(_$_NotLoggedAuthStats) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NotLoggedAuthStats implements _NotLoggedAuthStats {
  _$_NotLoggedAuthStats();

  @override
  String toString() {
    return 'AuthState.notLogged()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NotLoggedAuthStats);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() logged,
    required TResult Function() notLogged,
    required TResult Function() loading,
    required TResult Function(Failure error) error,
  }) {
    return notLogged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? logged,
    TResult? Function()? notLogged,
    TResult? Function()? loading,
    TResult? Function(Failure error)? error,
  }) {
    return notLogged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? logged,
    TResult Function()? notLogged,
    TResult Function()? loading,
    TResult Function(Failure error)? error,
    required TResult orElse(),
  }) {
    if (notLogged != null) {
      return notLogged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAuthStats value) initial,
    required TResult Function(_LoggedAuthStats value) logged,
    required TResult Function(_NotLoggedAuthStats value) notLogged,
    required TResult Function(_LoadingAuthStats value) loading,
    required TResult Function(_ErrorAuthStats value) error,
  }) {
    return notLogged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialAuthStats value)? initial,
    TResult? Function(_LoggedAuthStats value)? logged,
    TResult? Function(_NotLoggedAuthStats value)? notLogged,
    TResult? Function(_LoadingAuthStats value)? loading,
    TResult? Function(_ErrorAuthStats value)? error,
  }) {
    return notLogged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAuthStats value)? initial,
    TResult Function(_LoggedAuthStats value)? logged,
    TResult Function(_NotLoggedAuthStats value)? notLogged,
    TResult Function(_LoadingAuthStats value)? loading,
    TResult Function(_ErrorAuthStats value)? error,
    required TResult orElse(),
  }) {
    if (notLogged != null) {
      return notLogged(this);
    }
    return orElse();
  }
}

abstract class _NotLoggedAuthStats implements AuthState {
  factory _NotLoggedAuthStats() = _$_NotLoggedAuthStats;
}

/// @nodoc
abstract class _$$_LoadingAuthStatsCopyWith<$Res> {
  factory _$$_LoadingAuthStatsCopyWith(
          _$_LoadingAuthStats value, $Res Function(_$_LoadingAuthStats) then) =
      __$$_LoadingAuthStatsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingAuthStatsCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_LoadingAuthStats>
    implements _$$_LoadingAuthStatsCopyWith<$Res> {
  __$$_LoadingAuthStatsCopyWithImpl(
      _$_LoadingAuthStats _value, $Res Function(_$_LoadingAuthStats) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadingAuthStats implements _LoadingAuthStats {
  _$_LoadingAuthStats();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadingAuthStats);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() logged,
    required TResult Function() notLogged,
    required TResult Function() loading,
    required TResult Function(Failure error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? logged,
    TResult? Function()? notLogged,
    TResult? Function()? loading,
    TResult? Function(Failure error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? logged,
    TResult Function()? notLogged,
    TResult Function()? loading,
    TResult Function(Failure error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAuthStats value) initial,
    required TResult Function(_LoggedAuthStats value) logged,
    required TResult Function(_NotLoggedAuthStats value) notLogged,
    required TResult Function(_LoadingAuthStats value) loading,
    required TResult Function(_ErrorAuthStats value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialAuthStats value)? initial,
    TResult? Function(_LoggedAuthStats value)? logged,
    TResult? Function(_NotLoggedAuthStats value)? notLogged,
    TResult? Function(_LoadingAuthStats value)? loading,
    TResult? Function(_ErrorAuthStats value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAuthStats value)? initial,
    TResult Function(_LoggedAuthStats value)? logged,
    TResult Function(_NotLoggedAuthStats value)? notLogged,
    TResult Function(_LoadingAuthStats value)? loading,
    TResult Function(_ErrorAuthStats value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingAuthStats implements AuthState {
  factory _LoadingAuthStats() = _$_LoadingAuthStats;
}

/// @nodoc
abstract class _$$_ErrorAuthStatsCopyWith<$Res> {
  factory _$$_ErrorAuthStatsCopyWith(
          _$_ErrorAuthStats value, $Res Function(_$_ErrorAuthStats) then) =
      __$$_ErrorAuthStatsCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure error});
}

/// @nodoc
class __$$_ErrorAuthStatsCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_ErrorAuthStats>
    implements _$$_ErrorAuthStatsCopyWith<$Res> {
  __$$_ErrorAuthStatsCopyWithImpl(
      _$_ErrorAuthStats _value, $Res Function(_$_ErrorAuthStats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_ErrorAuthStats(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_ErrorAuthStats implements _ErrorAuthStats {
  _$_ErrorAuthStats(this.error);

  @override
  final Failure error;

  @override
  String toString() {
    return 'AuthState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorAuthStats &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorAuthStatsCopyWith<_$_ErrorAuthStats> get copyWith =>
      __$$_ErrorAuthStatsCopyWithImpl<_$_ErrorAuthStats>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() logged,
    required TResult Function() notLogged,
    required TResult Function() loading,
    required TResult Function(Failure error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? logged,
    TResult? Function()? notLogged,
    TResult? Function()? loading,
    TResult? Function(Failure error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? logged,
    TResult Function()? notLogged,
    TResult Function()? loading,
    TResult Function(Failure error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialAuthStats value) initial,
    required TResult Function(_LoggedAuthStats value) logged,
    required TResult Function(_NotLoggedAuthStats value) notLogged,
    required TResult Function(_LoadingAuthStats value) loading,
    required TResult Function(_ErrorAuthStats value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialAuthStats value)? initial,
    TResult? Function(_LoggedAuthStats value)? logged,
    TResult? Function(_NotLoggedAuthStats value)? notLogged,
    TResult? Function(_LoadingAuthStats value)? loading,
    TResult? Function(_ErrorAuthStats value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialAuthStats value)? initial,
    TResult Function(_LoggedAuthStats value)? logged,
    TResult Function(_NotLoggedAuthStats value)? notLogged,
    TResult Function(_LoadingAuthStats value)? loading,
    TResult Function(_ErrorAuthStats value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorAuthStats implements AuthState {
  factory _ErrorAuthStats(final Failure error) = _$_ErrorAuthStats;

  Failure get error;
  @JsonKey(ignore: true)
  _$$_ErrorAuthStatsCopyWith<_$_ErrorAuthStats> get copyWith =>
      throw _privateConstructorUsedError;
}
