// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'puzzle_mode_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PuzzleModeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Side side) turnOf,
    required TResult Function(PuzzleModel puzzle) puzzleLoaded,
    required TResult Function(Move move) pieceMoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Side side)? turnOf,
    TResult? Function(PuzzleModel puzzle)? puzzleLoaded,
    TResult? Function(Move move)? pieceMoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Side side)? turnOf,
    TResult Function(PuzzleModel puzzle)? puzzleLoaded,
    TResult Function(Move move)? pieceMoved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_TurnOf value) turnOf,
    required TResult Function(_Puzzle value) puzzleLoaded,
    required TResult Function(_PieceMoved value) pieceMoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_TurnOf value)? turnOf,
    TResult? Function(_Puzzle value)? puzzleLoaded,
    TResult? Function(_PieceMoved value)? pieceMoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TurnOf value)? turnOf,
    TResult Function(_Puzzle value)? puzzleLoaded,
    TResult Function(_PieceMoved value)? pieceMoved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PuzzleModeStateCopyWith<$Res> {
  factory $PuzzleModeStateCopyWith(
          PuzzleModeState value, $Res Function(PuzzleModeState) then) =
      _$PuzzleModeStateCopyWithImpl<$Res, PuzzleModeState>;
}

/// @nodoc
class _$PuzzleModeStateCopyWithImpl<$Res, $Val extends PuzzleModeState>
    implements $PuzzleModeStateCopyWith<$Res> {
  _$PuzzleModeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$PuzzleModeStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Side side) turnOf,
    required TResult Function(PuzzleModel puzzle) puzzleLoaded,
    required TResult Function(Move move) pieceMoved,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Side side)? turnOf,
    TResult? Function(PuzzleModel puzzle)? puzzleLoaded,
    TResult? Function(Move move)? pieceMoved,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Side side)? turnOf,
    TResult Function(PuzzleModel puzzle)? puzzleLoaded,
    TResult Function(Move move)? pieceMoved,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_TurnOf value) turnOf,
    required TResult Function(_Puzzle value) puzzleLoaded,
    required TResult Function(_PieceMoved value) pieceMoved,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_TurnOf value)? turnOf,
    TResult? Function(_Puzzle value)? puzzleLoaded,
    TResult? Function(_PieceMoved value)? pieceMoved,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TurnOf value)? turnOf,
    TResult Function(_Puzzle value)? puzzleLoaded,
    TResult Function(_PieceMoved value)? pieceMoved,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends PuzzleModeState {
  const factory _Initial() = _$_Initial;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$PuzzleModeStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading extends _Loading {
  const _$_Loading() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Side side) turnOf,
    required TResult Function(PuzzleModel puzzle) puzzleLoaded,
    required TResult Function(Move move) pieceMoved,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Side side)? turnOf,
    TResult? Function(PuzzleModel puzzle)? puzzleLoaded,
    TResult? Function(Move move)? pieceMoved,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Side side)? turnOf,
    TResult Function(PuzzleModel puzzle)? puzzleLoaded,
    TResult Function(Move move)? pieceMoved,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_TurnOf value) turnOf,
    required TResult Function(_Puzzle value) puzzleLoaded,
    required TResult Function(_PieceMoved value) pieceMoved,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_TurnOf value)? turnOf,
    TResult? Function(_Puzzle value)? puzzleLoaded,
    TResult? Function(_PieceMoved value)? pieceMoved,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TurnOf value)? turnOf,
    TResult Function(_Puzzle value)? puzzleLoaded,
    TResult Function(_PieceMoved value)? pieceMoved,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends PuzzleModeState {
  const factory _Loading() = _$_Loading;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$_TurnOfCopyWith<$Res> {
  factory _$$_TurnOfCopyWith(_$_TurnOf value, $Res Function(_$_TurnOf) then) =
      __$$_TurnOfCopyWithImpl<$Res>;
  @useResult
  $Res call({Side side});
}

/// @nodoc
class __$$_TurnOfCopyWithImpl<$Res>
    extends _$PuzzleModeStateCopyWithImpl<$Res, _$_TurnOf>
    implements _$$_TurnOfCopyWith<$Res> {
  __$$_TurnOfCopyWithImpl(_$_TurnOf _value, $Res Function(_$_TurnOf) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? side = null,
  }) {
    return _then(_$_TurnOf(
      null == side
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as Side,
    ));
  }
}

/// @nodoc

class _$_TurnOf extends _TurnOf {
  const _$_TurnOf(this.side) : super._();

  @override
  final Side side;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TurnOfCopyWith<_$_TurnOf> get copyWith =>
      __$$_TurnOfCopyWithImpl<_$_TurnOf>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Side side) turnOf,
    required TResult Function(PuzzleModel puzzle) puzzleLoaded,
    required TResult Function(Move move) pieceMoved,
  }) {
    return turnOf(side);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Side side)? turnOf,
    TResult? Function(PuzzleModel puzzle)? puzzleLoaded,
    TResult? Function(Move move)? pieceMoved,
  }) {
    return turnOf?.call(side);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Side side)? turnOf,
    TResult Function(PuzzleModel puzzle)? puzzleLoaded,
    TResult Function(Move move)? pieceMoved,
    required TResult orElse(),
  }) {
    if (turnOf != null) {
      return turnOf(side);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_TurnOf value) turnOf,
    required TResult Function(_Puzzle value) puzzleLoaded,
    required TResult Function(_PieceMoved value) pieceMoved,
  }) {
    return turnOf(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_TurnOf value)? turnOf,
    TResult? Function(_Puzzle value)? puzzleLoaded,
    TResult? Function(_PieceMoved value)? pieceMoved,
  }) {
    return turnOf?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TurnOf value)? turnOf,
    TResult Function(_Puzzle value)? puzzleLoaded,
    TResult Function(_PieceMoved value)? pieceMoved,
    required TResult orElse(),
  }) {
    if (turnOf != null) {
      return turnOf(this);
    }
    return orElse();
  }
}

abstract class _TurnOf extends PuzzleModeState {
  const factory _TurnOf(final Side side) = _$_TurnOf;
  const _TurnOf._() : super._();

  Side get side;
  @JsonKey(ignore: true)
  _$$_TurnOfCopyWith<_$_TurnOf> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PuzzleCopyWith<$Res> {
  factory _$$_PuzzleCopyWith(_$_Puzzle value, $Res Function(_$_Puzzle) then) =
      __$$_PuzzleCopyWithImpl<$Res>;
  @useResult
  $Res call({PuzzleModel puzzle});
}

/// @nodoc
class __$$_PuzzleCopyWithImpl<$Res>
    extends _$PuzzleModeStateCopyWithImpl<$Res, _$_Puzzle>
    implements _$$_PuzzleCopyWith<$Res> {
  __$$_PuzzleCopyWithImpl(_$_Puzzle _value, $Res Function(_$_Puzzle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? puzzle = null,
  }) {
    return _then(_$_Puzzle(
      null == puzzle
          ? _value.puzzle
          : puzzle // ignore: cast_nullable_to_non_nullable
              as PuzzleModel,
    ));
  }
}

/// @nodoc

class _$_Puzzle extends _Puzzle {
  const _$_Puzzle(this.puzzle) : super._();

  @override
  final PuzzleModel puzzle;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PuzzleCopyWith<_$_Puzzle> get copyWith =>
      __$$_PuzzleCopyWithImpl<_$_Puzzle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Side side) turnOf,
    required TResult Function(PuzzleModel puzzle) puzzleLoaded,
    required TResult Function(Move move) pieceMoved,
  }) {
    return puzzleLoaded(puzzle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Side side)? turnOf,
    TResult? Function(PuzzleModel puzzle)? puzzleLoaded,
    TResult? Function(Move move)? pieceMoved,
  }) {
    return puzzleLoaded?.call(puzzle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Side side)? turnOf,
    TResult Function(PuzzleModel puzzle)? puzzleLoaded,
    TResult Function(Move move)? pieceMoved,
    required TResult orElse(),
  }) {
    if (puzzleLoaded != null) {
      return puzzleLoaded(puzzle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_TurnOf value) turnOf,
    required TResult Function(_Puzzle value) puzzleLoaded,
    required TResult Function(_PieceMoved value) pieceMoved,
  }) {
    return puzzleLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_TurnOf value)? turnOf,
    TResult? Function(_Puzzle value)? puzzleLoaded,
    TResult? Function(_PieceMoved value)? pieceMoved,
  }) {
    return puzzleLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TurnOf value)? turnOf,
    TResult Function(_Puzzle value)? puzzleLoaded,
    TResult Function(_PieceMoved value)? pieceMoved,
    required TResult orElse(),
  }) {
    if (puzzleLoaded != null) {
      return puzzleLoaded(this);
    }
    return orElse();
  }
}

abstract class _Puzzle extends PuzzleModeState {
  const factory _Puzzle(final PuzzleModel puzzle) = _$_Puzzle;
  const _Puzzle._() : super._();

  PuzzleModel get puzzle;
  @JsonKey(ignore: true)
  _$$_PuzzleCopyWith<_$_Puzzle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PieceMovedCopyWith<$Res> {
  factory _$$_PieceMovedCopyWith(
          _$_PieceMoved value, $Res Function(_$_PieceMoved) then) =
      __$$_PieceMovedCopyWithImpl<$Res>;
  @useResult
  $Res call({Move move});
}

/// @nodoc
class __$$_PieceMovedCopyWithImpl<$Res>
    extends _$PuzzleModeStateCopyWithImpl<$Res, _$_PieceMoved>
    implements _$$_PieceMovedCopyWith<$Res> {
  __$$_PieceMovedCopyWithImpl(
      _$_PieceMoved _value, $Res Function(_$_PieceMoved) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? move = null,
  }) {
    return _then(_$_PieceMoved(
      null == move
          ? _value.move
          : move // ignore: cast_nullable_to_non_nullable
              as Move,
    ));
  }
}

/// @nodoc

class _$_PieceMoved extends _PieceMoved {
  const _$_PieceMoved(this.move) : super._();

  @override
  final Move move;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PieceMovedCopyWith<_$_PieceMoved> get copyWith =>
      __$$_PieceMovedCopyWithImpl<_$_PieceMoved>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Side side) turnOf,
    required TResult Function(PuzzleModel puzzle) puzzleLoaded,
    required TResult Function(Move move) pieceMoved,
  }) {
    return pieceMoved(move);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Side side)? turnOf,
    TResult? Function(PuzzleModel puzzle)? puzzleLoaded,
    TResult? Function(Move move)? pieceMoved,
  }) {
    return pieceMoved?.call(move);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Side side)? turnOf,
    TResult Function(PuzzleModel puzzle)? puzzleLoaded,
    TResult Function(Move move)? pieceMoved,
    required TResult orElse(),
  }) {
    if (pieceMoved != null) {
      return pieceMoved(move);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_TurnOf value) turnOf,
    required TResult Function(_Puzzle value) puzzleLoaded,
    required TResult Function(_PieceMoved value) pieceMoved,
  }) {
    return pieceMoved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_TurnOf value)? turnOf,
    TResult? Function(_Puzzle value)? puzzleLoaded,
    TResult? Function(_PieceMoved value)? pieceMoved,
  }) {
    return pieceMoved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TurnOf value)? turnOf,
    TResult Function(_Puzzle value)? puzzleLoaded,
    TResult Function(_PieceMoved value)? pieceMoved,
    required TResult orElse(),
  }) {
    if (pieceMoved != null) {
      return pieceMoved(this);
    }
    return orElse();
  }
}

abstract class _PieceMoved extends PuzzleModeState {
  const factory _PieceMoved(final Move move) = _$_PieceMoved;
  const _PieceMoved._() : super._();

  Move get move;
  @JsonKey(ignore: true)
  _$$_PieceMovedCopyWith<_$_PieceMoved> get copyWith =>
      throw _privateConstructorUsedError;
}
