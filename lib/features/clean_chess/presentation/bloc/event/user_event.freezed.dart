// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String term, bool friend) searchUsersByTerm,
    required TResult Function(String term, bool friend) searchUsernamesByTerm,
    required TResult Function(List<String> ids, bool withGameIds)
        getRealtimeStatus,
    required TResult Function() getTop10Players,
    required TResult Function(PerfType perfType, int nb)
        getChessVariantLeaderboard,
    required TResult Function(String username, bool trophies) getPublicData,
    required TResult Function(String username) getRatingHistory,
    required TResult Function(List<String> ids) getManyByIds,
    required TResult Function() getLiveStreamers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String term, bool friend)? searchUsersByTerm,
    TResult? Function(String term, bool friend)? searchUsernamesByTerm,
    TResult? Function(List<String> ids, bool withGameIds)? getRealtimeStatus,
    TResult? Function()? getTop10Players,
    TResult? Function(PerfType perfType, int nb)? getChessVariantLeaderboard,
    TResult? Function(String username, bool trophies)? getPublicData,
    TResult? Function(String username)? getRatingHistory,
    TResult? Function(List<String> ids)? getManyByIds,
    TResult? Function()? getLiveStreamers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String term, bool friend)? searchUsersByTerm,
    TResult Function(String term, bool friend)? searchUsernamesByTerm,
    TResult Function(List<String> ids, bool withGameIds)? getRealtimeStatus,
    TResult Function()? getTop10Players,
    TResult Function(PerfType perfType, int nb)? getChessVariantLeaderboard,
    TResult Function(String username, bool trophies)? getPublicData,
    TResult Function(String username)? getRatingHistory,
    TResult Function(List<String> ids)? getManyByIds,
    TResult Function()? getLiveStreamers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchUsersByTermEvent value) searchUsersByTerm,
    required TResult Function(SearchUsernamesByTermEvent value)
        searchUsernamesByTerm,
    required TResult Function(GetRealtimeStatusEvent value) getRealtimeStatus,
    required TResult Function(GetTop10PlayersEvent value) getTop10Players,
    required TResult Function(GetChessVariantLeaderboardEvent value)
        getChessVariantLeaderboard,
    required TResult Function(GetPublicDataEvent value) getPublicData,
    required TResult Function(GetRatingHistoryEvent value) getRatingHistory,
    required TResult Function(GetManyByIdsEvent value) getManyByIds,
    required TResult Function(GetLiveStreamersEvent value) getLiveStreamers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchUsersByTermEvent value)? searchUsersByTerm,
    TResult? Function(SearchUsernamesByTermEvent value)? searchUsernamesByTerm,
    TResult? Function(GetRealtimeStatusEvent value)? getRealtimeStatus,
    TResult? Function(GetTop10PlayersEvent value)? getTop10Players,
    TResult? Function(GetChessVariantLeaderboardEvent value)?
        getChessVariantLeaderboard,
    TResult? Function(GetPublicDataEvent value)? getPublicData,
    TResult? Function(GetRatingHistoryEvent value)? getRatingHistory,
    TResult? Function(GetManyByIdsEvent value)? getManyByIds,
    TResult? Function(GetLiveStreamersEvent value)? getLiveStreamers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchUsersByTermEvent value)? searchUsersByTerm,
    TResult Function(SearchUsernamesByTermEvent value)? searchUsernamesByTerm,
    TResult Function(GetRealtimeStatusEvent value)? getRealtimeStatus,
    TResult Function(GetTop10PlayersEvent value)? getTop10Players,
    TResult Function(GetChessVariantLeaderboardEvent value)?
        getChessVariantLeaderboard,
    TResult Function(GetPublicDataEvent value)? getPublicData,
    TResult Function(GetRatingHistoryEvent value)? getRatingHistory,
    TResult Function(GetManyByIdsEvent value)? getManyByIds,
    TResult Function(GetLiveStreamersEvent value)? getLiveStreamers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SearchUsersByTermEventCopyWith<$Res> {
  factory _$$SearchUsersByTermEventCopyWith(_$SearchUsersByTermEvent value,
          $Res Function(_$SearchUsersByTermEvent) then) =
      __$$SearchUsersByTermEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String term, bool friend});
}

/// @nodoc
class __$$SearchUsersByTermEventCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$SearchUsersByTermEvent>
    implements _$$SearchUsersByTermEventCopyWith<$Res> {
  __$$SearchUsersByTermEventCopyWithImpl(_$SearchUsersByTermEvent _value,
      $Res Function(_$SearchUsersByTermEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? term = null,
    Object? friend = null,
  }) {
    return _then(_$SearchUsersByTermEvent(
      term: null == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String,
      friend: null == friend
          ? _value.friend
          : friend // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SearchUsersByTermEvent
    with DiagnosticableTreeMixin
    implements SearchUsersByTermEvent {
  const _$SearchUsersByTermEvent({required this.term, this.friend = false});

  @override
  final String term;
  @override
  @JsonKey()
  final bool friend;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.searchUsersByTerm(term: $term, friend: $friend)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEvent.searchUsersByTerm'))
      ..add(DiagnosticsProperty('term', term))
      ..add(DiagnosticsProperty('friend', friend));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUsersByTermEvent &&
            (identical(other.term, term) || other.term == term) &&
            (identical(other.friend, friend) || other.friend == friend));
  }

  @override
  int get hashCode => Object.hash(runtimeType, term, friend);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchUsersByTermEventCopyWith<_$SearchUsersByTermEvent> get copyWith =>
      __$$SearchUsersByTermEventCopyWithImpl<_$SearchUsersByTermEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String term, bool friend) searchUsersByTerm,
    required TResult Function(String term, bool friend) searchUsernamesByTerm,
    required TResult Function(List<String> ids, bool withGameIds)
        getRealtimeStatus,
    required TResult Function() getTop10Players,
    required TResult Function(PerfType perfType, int nb)
        getChessVariantLeaderboard,
    required TResult Function(String username, bool trophies) getPublicData,
    required TResult Function(String username) getRatingHistory,
    required TResult Function(List<String> ids) getManyByIds,
    required TResult Function() getLiveStreamers,
  }) {
    return searchUsersByTerm(term, friend);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String term, bool friend)? searchUsersByTerm,
    TResult? Function(String term, bool friend)? searchUsernamesByTerm,
    TResult? Function(List<String> ids, bool withGameIds)? getRealtimeStatus,
    TResult? Function()? getTop10Players,
    TResult? Function(PerfType perfType, int nb)? getChessVariantLeaderboard,
    TResult? Function(String username, bool trophies)? getPublicData,
    TResult? Function(String username)? getRatingHistory,
    TResult? Function(List<String> ids)? getManyByIds,
    TResult? Function()? getLiveStreamers,
  }) {
    return searchUsersByTerm?.call(term, friend);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String term, bool friend)? searchUsersByTerm,
    TResult Function(String term, bool friend)? searchUsernamesByTerm,
    TResult Function(List<String> ids, bool withGameIds)? getRealtimeStatus,
    TResult Function()? getTop10Players,
    TResult Function(PerfType perfType, int nb)? getChessVariantLeaderboard,
    TResult Function(String username, bool trophies)? getPublicData,
    TResult Function(String username)? getRatingHistory,
    TResult Function(List<String> ids)? getManyByIds,
    TResult Function()? getLiveStreamers,
    required TResult orElse(),
  }) {
    if (searchUsersByTerm != null) {
      return searchUsersByTerm(term, friend);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchUsersByTermEvent value) searchUsersByTerm,
    required TResult Function(SearchUsernamesByTermEvent value)
        searchUsernamesByTerm,
    required TResult Function(GetRealtimeStatusEvent value) getRealtimeStatus,
    required TResult Function(GetTop10PlayersEvent value) getTop10Players,
    required TResult Function(GetChessVariantLeaderboardEvent value)
        getChessVariantLeaderboard,
    required TResult Function(GetPublicDataEvent value) getPublicData,
    required TResult Function(GetRatingHistoryEvent value) getRatingHistory,
    required TResult Function(GetManyByIdsEvent value) getManyByIds,
    required TResult Function(GetLiveStreamersEvent value) getLiveStreamers,
  }) {
    return searchUsersByTerm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchUsersByTermEvent value)? searchUsersByTerm,
    TResult? Function(SearchUsernamesByTermEvent value)? searchUsernamesByTerm,
    TResult? Function(GetRealtimeStatusEvent value)? getRealtimeStatus,
    TResult? Function(GetTop10PlayersEvent value)? getTop10Players,
    TResult? Function(GetChessVariantLeaderboardEvent value)?
        getChessVariantLeaderboard,
    TResult? Function(GetPublicDataEvent value)? getPublicData,
    TResult? Function(GetRatingHistoryEvent value)? getRatingHistory,
    TResult? Function(GetManyByIdsEvent value)? getManyByIds,
    TResult? Function(GetLiveStreamersEvent value)? getLiveStreamers,
  }) {
    return searchUsersByTerm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchUsersByTermEvent value)? searchUsersByTerm,
    TResult Function(SearchUsernamesByTermEvent value)? searchUsernamesByTerm,
    TResult Function(GetRealtimeStatusEvent value)? getRealtimeStatus,
    TResult Function(GetTop10PlayersEvent value)? getTop10Players,
    TResult Function(GetChessVariantLeaderboardEvent value)?
        getChessVariantLeaderboard,
    TResult Function(GetPublicDataEvent value)? getPublicData,
    TResult Function(GetRatingHistoryEvent value)? getRatingHistory,
    TResult Function(GetManyByIdsEvent value)? getManyByIds,
    TResult Function(GetLiveStreamersEvent value)? getLiveStreamers,
    required TResult orElse(),
  }) {
    if (searchUsersByTerm != null) {
      return searchUsersByTerm(this);
    }
    return orElse();
  }
}

abstract class SearchUsersByTermEvent implements UserEvent {
  const factory SearchUsersByTermEvent(
      {required final String term,
      final bool friend}) = _$SearchUsersByTermEvent;

  String get term;
  bool get friend;
  @JsonKey(ignore: true)
  _$$SearchUsersByTermEventCopyWith<_$SearchUsersByTermEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchUsernamesByTermEventCopyWith<$Res> {
  factory _$$SearchUsernamesByTermEventCopyWith(
          _$SearchUsernamesByTermEvent value,
          $Res Function(_$SearchUsernamesByTermEvent) then) =
      __$$SearchUsernamesByTermEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String term, bool friend});
}

/// @nodoc
class __$$SearchUsernamesByTermEventCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$SearchUsernamesByTermEvent>
    implements _$$SearchUsernamesByTermEventCopyWith<$Res> {
  __$$SearchUsernamesByTermEventCopyWithImpl(
      _$SearchUsernamesByTermEvent _value,
      $Res Function(_$SearchUsernamesByTermEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? term = null,
    Object? friend = null,
  }) {
    return _then(_$SearchUsernamesByTermEvent(
      term: null == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String,
      friend: null == friend
          ? _value.friend
          : friend // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SearchUsernamesByTermEvent
    with DiagnosticableTreeMixin
    implements SearchUsernamesByTermEvent {
  const _$SearchUsernamesByTermEvent({required this.term, this.friend = false});

  @override
  final String term;
  @override
  @JsonKey()
  final bool friend;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.searchUsernamesByTerm(term: $term, friend: $friend)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEvent.searchUsernamesByTerm'))
      ..add(DiagnosticsProperty('term', term))
      ..add(DiagnosticsProperty('friend', friend));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUsernamesByTermEvent &&
            (identical(other.term, term) || other.term == term) &&
            (identical(other.friend, friend) || other.friend == friend));
  }

  @override
  int get hashCode => Object.hash(runtimeType, term, friend);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchUsernamesByTermEventCopyWith<_$SearchUsernamesByTermEvent>
      get copyWith => __$$SearchUsernamesByTermEventCopyWithImpl<
          _$SearchUsernamesByTermEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String term, bool friend) searchUsersByTerm,
    required TResult Function(String term, bool friend) searchUsernamesByTerm,
    required TResult Function(List<String> ids, bool withGameIds)
        getRealtimeStatus,
    required TResult Function() getTop10Players,
    required TResult Function(PerfType perfType, int nb)
        getChessVariantLeaderboard,
    required TResult Function(String username, bool trophies) getPublicData,
    required TResult Function(String username) getRatingHistory,
    required TResult Function(List<String> ids) getManyByIds,
    required TResult Function() getLiveStreamers,
  }) {
    return searchUsernamesByTerm(term, friend);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String term, bool friend)? searchUsersByTerm,
    TResult? Function(String term, bool friend)? searchUsernamesByTerm,
    TResult? Function(List<String> ids, bool withGameIds)? getRealtimeStatus,
    TResult? Function()? getTop10Players,
    TResult? Function(PerfType perfType, int nb)? getChessVariantLeaderboard,
    TResult? Function(String username, bool trophies)? getPublicData,
    TResult? Function(String username)? getRatingHistory,
    TResult? Function(List<String> ids)? getManyByIds,
    TResult? Function()? getLiveStreamers,
  }) {
    return searchUsernamesByTerm?.call(term, friend);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String term, bool friend)? searchUsersByTerm,
    TResult Function(String term, bool friend)? searchUsernamesByTerm,
    TResult Function(List<String> ids, bool withGameIds)? getRealtimeStatus,
    TResult Function()? getTop10Players,
    TResult Function(PerfType perfType, int nb)? getChessVariantLeaderboard,
    TResult Function(String username, bool trophies)? getPublicData,
    TResult Function(String username)? getRatingHistory,
    TResult Function(List<String> ids)? getManyByIds,
    TResult Function()? getLiveStreamers,
    required TResult orElse(),
  }) {
    if (searchUsernamesByTerm != null) {
      return searchUsernamesByTerm(term, friend);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchUsersByTermEvent value) searchUsersByTerm,
    required TResult Function(SearchUsernamesByTermEvent value)
        searchUsernamesByTerm,
    required TResult Function(GetRealtimeStatusEvent value) getRealtimeStatus,
    required TResult Function(GetTop10PlayersEvent value) getTop10Players,
    required TResult Function(GetChessVariantLeaderboardEvent value)
        getChessVariantLeaderboard,
    required TResult Function(GetPublicDataEvent value) getPublicData,
    required TResult Function(GetRatingHistoryEvent value) getRatingHistory,
    required TResult Function(GetManyByIdsEvent value) getManyByIds,
    required TResult Function(GetLiveStreamersEvent value) getLiveStreamers,
  }) {
    return searchUsernamesByTerm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchUsersByTermEvent value)? searchUsersByTerm,
    TResult? Function(SearchUsernamesByTermEvent value)? searchUsernamesByTerm,
    TResult? Function(GetRealtimeStatusEvent value)? getRealtimeStatus,
    TResult? Function(GetTop10PlayersEvent value)? getTop10Players,
    TResult? Function(GetChessVariantLeaderboardEvent value)?
        getChessVariantLeaderboard,
    TResult? Function(GetPublicDataEvent value)? getPublicData,
    TResult? Function(GetRatingHistoryEvent value)? getRatingHistory,
    TResult? Function(GetManyByIdsEvent value)? getManyByIds,
    TResult? Function(GetLiveStreamersEvent value)? getLiveStreamers,
  }) {
    return searchUsernamesByTerm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchUsersByTermEvent value)? searchUsersByTerm,
    TResult Function(SearchUsernamesByTermEvent value)? searchUsernamesByTerm,
    TResult Function(GetRealtimeStatusEvent value)? getRealtimeStatus,
    TResult Function(GetTop10PlayersEvent value)? getTop10Players,
    TResult Function(GetChessVariantLeaderboardEvent value)?
        getChessVariantLeaderboard,
    TResult Function(GetPublicDataEvent value)? getPublicData,
    TResult Function(GetRatingHistoryEvent value)? getRatingHistory,
    TResult Function(GetManyByIdsEvent value)? getManyByIds,
    TResult Function(GetLiveStreamersEvent value)? getLiveStreamers,
    required TResult orElse(),
  }) {
    if (searchUsernamesByTerm != null) {
      return searchUsernamesByTerm(this);
    }
    return orElse();
  }
}

abstract class SearchUsernamesByTermEvent implements UserEvent {
  const factory SearchUsernamesByTermEvent(
      {required final String term,
      final bool friend}) = _$SearchUsernamesByTermEvent;

  String get term;
  bool get friend;
  @JsonKey(ignore: true)
  _$$SearchUsernamesByTermEventCopyWith<_$SearchUsernamesByTermEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetRealtimeStatusEventCopyWith<$Res> {
  factory _$$GetRealtimeStatusEventCopyWith(_$GetRealtimeStatusEvent value,
          $Res Function(_$GetRealtimeStatusEvent) then) =
      __$$GetRealtimeStatusEventCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> ids, bool withGameIds});
}

/// @nodoc
class __$$GetRealtimeStatusEventCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetRealtimeStatusEvent>
    implements _$$GetRealtimeStatusEventCopyWith<$Res> {
  __$$GetRealtimeStatusEventCopyWithImpl(_$GetRealtimeStatusEvent _value,
      $Res Function(_$GetRealtimeStatusEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
    Object? withGameIds = null,
  }) {
    return _then(_$GetRealtimeStatusEvent(
      ids: null == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      withGameIds: null == withGameIds
          ? _value.withGameIds
          : withGameIds // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetRealtimeStatusEvent
    with DiagnosticableTreeMixin
    implements GetRealtimeStatusEvent {
  const _$GetRealtimeStatusEvent(
      {required final List<String> ids, this.withGameIds = false})
      : _ids = ids;

  final List<String> _ids;
  @override
  List<String> get ids {
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ids);
  }

  @override
  @JsonKey()
  final bool withGameIds;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.getRealtimeStatus(ids: $ids, withGameIds: $withGameIds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEvent.getRealtimeStatus'))
      ..add(DiagnosticsProperty('ids', ids))
      ..add(DiagnosticsProperty('withGameIds', withGameIds));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRealtimeStatusEvent &&
            const DeepCollectionEquality().equals(other._ids, _ids) &&
            (identical(other.withGameIds, withGameIds) ||
                other.withGameIds == withGameIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_ids), withGameIds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRealtimeStatusEventCopyWith<_$GetRealtimeStatusEvent> get copyWith =>
      __$$GetRealtimeStatusEventCopyWithImpl<_$GetRealtimeStatusEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String term, bool friend) searchUsersByTerm,
    required TResult Function(String term, bool friend) searchUsernamesByTerm,
    required TResult Function(List<String> ids, bool withGameIds)
        getRealtimeStatus,
    required TResult Function() getTop10Players,
    required TResult Function(PerfType perfType, int nb)
        getChessVariantLeaderboard,
    required TResult Function(String username, bool trophies) getPublicData,
    required TResult Function(String username) getRatingHistory,
    required TResult Function(List<String> ids) getManyByIds,
    required TResult Function() getLiveStreamers,
  }) {
    return getRealtimeStatus(ids, withGameIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String term, bool friend)? searchUsersByTerm,
    TResult? Function(String term, bool friend)? searchUsernamesByTerm,
    TResult? Function(List<String> ids, bool withGameIds)? getRealtimeStatus,
    TResult? Function()? getTop10Players,
    TResult? Function(PerfType perfType, int nb)? getChessVariantLeaderboard,
    TResult? Function(String username, bool trophies)? getPublicData,
    TResult? Function(String username)? getRatingHistory,
    TResult? Function(List<String> ids)? getManyByIds,
    TResult? Function()? getLiveStreamers,
  }) {
    return getRealtimeStatus?.call(ids, withGameIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String term, bool friend)? searchUsersByTerm,
    TResult Function(String term, bool friend)? searchUsernamesByTerm,
    TResult Function(List<String> ids, bool withGameIds)? getRealtimeStatus,
    TResult Function()? getTop10Players,
    TResult Function(PerfType perfType, int nb)? getChessVariantLeaderboard,
    TResult Function(String username, bool trophies)? getPublicData,
    TResult Function(String username)? getRatingHistory,
    TResult Function(List<String> ids)? getManyByIds,
    TResult Function()? getLiveStreamers,
    required TResult orElse(),
  }) {
    if (getRealtimeStatus != null) {
      return getRealtimeStatus(ids, withGameIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchUsersByTermEvent value) searchUsersByTerm,
    required TResult Function(SearchUsernamesByTermEvent value)
        searchUsernamesByTerm,
    required TResult Function(GetRealtimeStatusEvent value) getRealtimeStatus,
    required TResult Function(GetTop10PlayersEvent value) getTop10Players,
    required TResult Function(GetChessVariantLeaderboardEvent value)
        getChessVariantLeaderboard,
    required TResult Function(GetPublicDataEvent value) getPublicData,
    required TResult Function(GetRatingHistoryEvent value) getRatingHistory,
    required TResult Function(GetManyByIdsEvent value) getManyByIds,
    required TResult Function(GetLiveStreamersEvent value) getLiveStreamers,
  }) {
    return getRealtimeStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchUsersByTermEvent value)? searchUsersByTerm,
    TResult? Function(SearchUsernamesByTermEvent value)? searchUsernamesByTerm,
    TResult? Function(GetRealtimeStatusEvent value)? getRealtimeStatus,
    TResult? Function(GetTop10PlayersEvent value)? getTop10Players,
    TResult? Function(GetChessVariantLeaderboardEvent value)?
        getChessVariantLeaderboard,
    TResult? Function(GetPublicDataEvent value)? getPublicData,
    TResult? Function(GetRatingHistoryEvent value)? getRatingHistory,
    TResult? Function(GetManyByIdsEvent value)? getManyByIds,
    TResult? Function(GetLiveStreamersEvent value)? getLiveStreamers,
  }) {
    return getRealtimeStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchUsersByTermEvent value)? searchUsersByTerm,
    TResult Function(SearchUsernamesByTermEvent value)? searchUsernamesByTerm,
    TResult Function(GetRealtimeStatusEvent value)? getRealtimeStatus,
    TResult Function(GetTop10PlayersEvent value)? getTop10Players,
    TResult Function(GetChessVariantLeaderboardEvent value)?
        getChessVariantLeaderboard,
    TResult Function(GetPublicDataEvent value)? getPublicData,
    TResult Function(GetRatingHistoryEvent value)? getRatingHistory,
    TResult Function(GetManyByIdsEvent value)? getManyByIds,
    TResult Function(GetLiveStreamersEvent value)? getLiveStreamers,
    required TResult orElse(),
  }) {
    if (getRealtimeStatus != null) {
      return getRealtimeStatus(this);
    }
    return orElse();
  }
}

abstract class GetRealtimeStatusEvent implements UserEvent {
  const factory GetRealtimeStatusEvent(
      {required final List<String> ids,
      final bool withGameIds}) = _$GetRealtimeStatusEvent;

  List<String> get ids;
  bool get withGameIds;
  @JsonKey(ignore: true)
  _$$GetRealtimeStatusEventCopyWith<_$GetRealtimeStatusEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetTop10PlayersEventCopyWith<$Res> {
  factory _$$GetTop10PlayersEventCopyWith(_$GetTop10PlayersEvent value,
          $Res Function(_$GetTop10PlayersEvent) then) =
      __$$GetTop10PlayersEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetTop10PlayersEventCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetTop10PlayersEvent>
    implements _$$GetTop10PlayersEventCopyWith<$Res> {
  __$$GetTop10PlayersEventCopyWithImpl(_$GetTop10PlayersEvent _value,
      $Res Function(_$GetTop10PlayersEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetTop10PlayersEvent
    with DiagnosticableTreeMixin
    implements GetTop10PlayersEvent {
  const _$GetTop10PlayersEvent();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.getTop10Players()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'UserEvent.getTop10Players'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetTop10PlayersEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String term, bool friend) searchUsersByTerm,
    required TResult Function(String term, bool friend) searchUsernamesByTerm,
    required TResult Function(List<String> ids, bool withGameIds)
        getRealtimeStatus,
    required TResult Function() getTop10Players,
    required TResult Function(PerfType perfType, int nb)
        getChessVariantLeaderboard,
    required TResult Function(String username, bool trophies) getPublicData,
    required TResult Function(String username) getRatingHistory,
    required TResult Function(List<String> ids) getManyByIds,
    required TResult Function() getLiveStreamers,
  }) {
    return getTop10Players();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String term, bool friend)? searchUsersByTerm,
    TResult? Function(String term, bool friend)? searchUsernamesByTerm,
    TResult? Function(List<String> ids, bool withGameIds)? getRealtimeStatus,
    TResult? Function()? getTop10Players,
    TResult? Function(PerfType perfType, int nb)? getChessVariantLeaderboard,
    TResult? Function(String username, bool trophies)? getPublicData,
    TResult? Function(String username)? getRatingHistory,
    TResult? Function(List<String> ids)? getManyByIds,
    TResult? Function()? getLiveStreamers,
  }) {
    return getTop10Players?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String term, bool friend)? searchUsersByTerm,
    TResult Function(String term, bool friend)? searchUsernamesByTerm,
    TResult Function(List<String> ids, bool withGameIds)? getRealtimeStatus,
    TResult Function()? getTop10Players,
    TResult Function(PerfType perfType, int nb)? getChessVariantLeaderboard,
    TResult Function(String username, bool trophies)? getPublicData,
    TResult Function(String username)? getRatingHistory,
    TResult Function(List<String> ids)? getManyByIds,
    TResult Function()? getLiveStreamers,
    required TResult orElse(),
  }) {
    if (getTop10Players != null) {
      return getTop10Players();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchUsersByTermEvent value) searchUsersByTerm,
    required TResult Function(SearchUsernamesByTermEvent value)
        searchUsernamesByTerm,
    required TResult Function(GetRealtimeStatusEvent value) getRealtimeStatus,
    required TResult Function(GetTop10PlayersEvent value) getTop10Players,
    required TResult Function(GetChessVariantLeaderboardEvent value)
        getChessVariantLeaderboard,
    required TResult Function(GetPublicDataEvent value) getPublicData,
    required TResult Function(GetRatingHistoryEvent value) getRatingHistory,
    required TResult Function(GetManyByIdsEvent value) getManyByIds,
    required TResult Function(GetLiveStreamersEvent value) getLiveStreamers,
  }) {
    return getTop10Players(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchUsersByTermEvent value)? searchUsersByTerm,
    TResult? Function(SearchUsernamesByTermEvent value)? searchUsernamesByTerm,
    TResult? Function(GetRealtimeStatusEvent value)? getRealtimeStatus,
    TResult? Function(GetTop10PlayersEvent value)? getTop10Players,
    TResult? Function(GetChessVariantLeaderboardEvent value)?
        getChessVariantLeaderboard,
    TResult? Function(GetPublicDataEvent value)? getPublicData,
    TResult? Function(GetRatingHistoryEvent value)? getRatingHistory,
    TResult? Function(GetManyByIdsEvent value)? getManyByIds,
    TResult? Function(GetLiveStreamersEvent value)? getLiveStreamers,
  }) {
    return getTop10Players?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchUsersByTermEvent value)? searchUsersByTerm,
    TResult Function(SearchUsernamesByTermEvent value)? searchUsernamesByTerm,
    TResult Function(GetRealtimeStatusEvent value)? getRealtimeStatus,
    TResult Function(GetTop10PlayersEvent value)? getTop10Players,
    TResult Function(GetChessVariantLeaderboardEvent value)?
        getChessVariantLeaderboard,
    TResult Function(GetPublicDataEvent value)? getPublicData,
    TResult Function(GetRatingHistoryEvent value)? getRatingHistory,
    TResult Function(GetManyByIdsEvent value)? getManyByIds,
    TResult Function(GetLiveStreamersEvent value)? getLiveStreamers,
    required TResult orElse(),
  }) {
    if (getTop10Players != null) {
      return getTop10Players(this);
    }
    return orElse();
  }
}

abstract class GetTop10PlayersEvent implements UserEvent {
  const factory GetTop10PlayersEvent() = _$GetTop10PlayersEvent;
}

/// @nodoc
abstract class _$$GetChessVariantLeaderboardEventCopyWith<$Res> {
  factory _$$GetChessVariantLeaderboardEventCopyWith(
          _$GetChessVariantLeaderboardEvent value,
          $Res Function(_$GetChessVariantLeaderboardEvent) then) =
      __$$GetChessVariantLeaderboardEventCopyWithImpl<$Res>;
  @useResult
  $Res call({PerfType perfType, int nb});
}

/// @nodoc
class __$$GetChessVariantLeaderboardEventCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetChessVariantLeaderboardEvent>
    implements _$$GetChessVariantLeaderboardEventCopyWith<$Res> {
  __$$GetChessVariantLeaderboardEventCopyWithImpl(
      _$GetChessVariantLeaderboardEvent _value,
      $Res Function(_$GetChessVariantLeaderboardEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perfType = null,
    Object? nb = null,
  }) {
    return _then(_$GetChessVariantLeaderboardEvent(
      perfType: null == perfType
          ? _value.perfType
          : perfType // ignore: cast_nullable_to_non_nullable
              as PerfType,
      nb: null == nb
          ? _value.nb
          : nb // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetChessVariantLeaderboardEvent
    with DiagnosticableTreeMixin
    implements GetChessVariantLeaderboardEvent {
  const _$GetChessVariantLeaderboardEvent(
      {required this.perfType, this.nb = 100});

  @override
  final PerfType perfType;
  @override
  @JsonKey()
  final int nb;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.getChessVariantLeaderboard(perfType: $perfType, nb: $nb)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEvent.getChessVariantLeaderboard'))
      ..add(DiagnosticsProperty('perfType', perfType))
      ..add(DiagnosticsProperty('nb', nb));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetChessVariantLeaderboardEvent &&
            (identical(other.perfType, perfType) ||
                other.perfType == perfType) &&
            (identical(other.nb, nb) || other.nb == nb));
  }

  @override
  int get hashCode => Object.hash(runtimeType, perfType, nb);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetChessVariantLeaderboardEventCopyWith<_$GetChessVariantLeaderboardEvent>
      get copyWith => __$$GetChessVariantLeaderboardEventCopyWithImpl<
          _$GetChessVariantLeaderboardEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String term, bool friend) searchUsersByTerm,
    required TResult Function(String term, bool friend) searchUsernamesByTerm,
    required TResult Function(List<String> ids, bool withGameIds)
        getRealtimeStatus,
    required TResult Function() getTop10Players,
    required TResult Function(PerfType perfType, int nb)
        getChessVariantLeaderboard,
    required TResult Function(String username, bool trophies) getPublicData,
    required TResult Function(String username) getRatingHistory,
    required TResult Function(List<String> ids) getManyByIds,
    required TResult Function() getLiveStreamers,
  }) {
    return getChessVariantLeaderboard(perfType, nb);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String term, bool friend)? searchUsersByTerm,
    TResult? Function(String term, bool friend)? searchUsernamesByTerm,
    TResult? Function(List<String> ids, bool withGameIds)? getRealtimeStatus,
    TResult? Function()? getTop10Players,
    TResult? Function(PerfType perfType, int nb)? getChessVariantLeaderboard,
    TResult? Function(String username, bool trophies)? getPublicData,
    TResult? Function(String username)? getRatingHistory,
    TResult? Function(List<String> ids)? getManyByIds,
    TResult? Function()? getLiveStreamers,
  }) {
    return getChessVariantLeaderboard?.call(perfType, nb);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String term, bool friend)? searchUsersByTerm,
    TResult Function(String term, bool friend)? searchUsernamesByTerm,
    TResult Function(List<String> ids, bool withGameIds)? getRealtimeStatus,
    TResult Function()? getTop10Players,
    TResult Function(PerfType perfType, int nb)? getChessVariantLeaderboard,
    TResult Function(String username, bool trophies)? getPublicData,
    TResult Function(String username)? getRatingHistory,
    TResult Function(List<String> ids)? getManyByIds,
    TResult Function()? getLiveStreamers,
    required TResult orElse(),
  }) {
    if (getChessVariantLeaderboard != null) {
      return getChessVariantLeaderboard(perfType, nb);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchUsersByTermEvent value) searchUsersByTerm,
    required TResult Function(SearchUsernamesByTermEvent value)
        searchUsernamesByTerm,
    required TResult Function(GetRealtimeStatusEvent value) getRealtimeStatus,
    required TResult Function(GetTop10PlayersEvent value) getTop10Players,
    required TResult Function(GetChessVariantLeaderboardEvent value)
        getChessVariantLeaderboard,
    required TResult Function(GetPublicDataEvent value) getPublicData,
    required TResult Function(GetRatingHistoryEvent value) getRatingHistory,
    required TResult Function(GetManyByIdsEvent value) getManyByIds,
    required TResult Function(GetLiveStreamersEvent value) getLiveStreamers,
  }) {
    return getChessVariantLeaderboard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchUsersByTermEvent value)? searchUsersByTerm,
    TResult? Function(SearchUsernamesByTermEvent value)? searchUsernamesByTerm,
    TResult? Function(GetRealtimeStatusEvent value)? getRealtimeStatus,
    TResult? Function(GetTop10PlayersEvent value)? getTop10Players,
    TResult? Function(GetChessVariantLeaderboardEvent value)?
        getChessVariantLeaderboard,
    TResult? Function(GetPublicDataEvent value)? getPublicData,
    TResult? Function(GetRatingHistoryEvent value)? getRatingHistory,
    TResult? Function(GetManyByIdsEvent value)? getManyByIds,
    TResult? Function(GetLiveStreamersEvent value)? getLiveStreamers,
  }) {
    return getChessVariantLeaderboard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchUsersByTermEvent value)? searchUsersByTerm,
    TResult Function(SearchUsernamesByTermEvent value)? searchUsernamesByTerm,
    TResult Function(GetRealtimeStatusEvent value)? getRealtimeStatus,
    TResult Function(GetTop10PlayersEvent value)? getTop10Players,
    TResult Function(GetChessVariantLeaderboardEvent value)?
        getChessVariantLeaderboard,
    TResult Function(GetPublicDataEvent value)? getPublicData,
    TResult Function(GetRatingHistoryEvent value)? getRatingHistory,
    TResult Function(GetManyByIdsEvent value)? getManyByIds,
    TResult Function(GetLiveStreamersEvent value)? getLiveStreamers,
    required TResult orElse(),
  }) {
    if (getChessVariantLeaderboard != null) {
      return getChessVariantLeaderboard(this);
    }
    return orElse();
  }
}

abstract class GetChessVariantLeaderboardEvent implements UserEvent {
  const factory GetChessVariantLeaderboardEvent(
      {required final PerfType perfType,
      final int nb}) = _$GetChessVariantLeaderboardEvent;

  PerfType get perfType;
  int get nb;
  @JsonKey(ignore: true)
  _$$GetChessVariantLeaderboardEventCopyWith<_$GetChessVariantLeaderboardEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetPublicDataEventCopyWith<$Res> {
  factory _$$GetPublicDataEventCopyWith(_$GetPublicDataEvent value,
          $Res Function(_$GetPublicDataEvent) then) =
      __$$GetPublicDataEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String username, bool trophies});
}

/// @nodoc
class __$$GetPublicDataEventCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetPublicDataEvent>
    implements _$$GetPublicDataEventCopyWith<$Res> {
  __$$GetPublicDataEventCopyWithImpl(
      _$GetPublicDataEvent _value, $Res Function(_$GetPublicDataEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? trophies = null,
  }) {
    return _then(_$GetPublicDataEvent(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      trophies: null == trophies
          ? _value.trophies
          : trophies // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetPublicDataEvent
    with DiagnosticableTreeMixin
    implements GetPublicDataEvent {
  const _$GetPublicDataEvent({required this.username, this.trophies = false});

  @override
  final String username;
  @override
  @JsonKey()
  final bool trophies;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.getPublicData(username: $username, trophies: $trophies)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEvent.getPublicData'))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('trophies', trophies));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPublicDataEvent &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.trophies, trophies) ||
                other.trophies == trophies));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, trophies);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPublicDataEventCopyWith<_$GetPublicDataEvent> get copyWith =>
      __$$GetPublicDataEventCopyWithImpl<_$GetPublicDataEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String term, bool friend) searchUsersByTerm,
    required TResult Function(String term, bool friend) searchUsernamesByTerm,
    required TResult Function(List<String> ids, bool withGameIds)
        getRealtimeStatus,
    required TResult Function() getTop10Players,
    required TResult Function(PerfType perfType, int nb)
        getChessVariantLeaderboard,
    required TResult Function(String username, bool trophies) getPublicData,
    required TResult Function(String username) getRatingHistory,
    required TResult Function(List<String> ids) getManyByIds,
    required TResult Function() getLiveStreamers,
  }) {
    return getPublicData(username, trophies);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String term, bool friend)? searchUsersByTerm,
    TResult? Function(String term, bool friend)? searchUsernamesByTerm,
    TResult? Function(List<String> ids, bool withGameIds)? getRealtimeStatus,
    TResult? Function()? getTop10Players,
    TResult? Function(PerfType perfType, int nb)? getChessVariantLeaderboard,
    TResult? Function(String username, bool trophies)? getPublicData,
    TResult? Function(String username)? getRatingHistory,
    TResult? Function(List<String> ids)? getManyByIds,
    TResult? Function()? getLiveStreamers,
  }) {
    return getPublicData?.call(username, trophies);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String term, bool friend)? searchUsersByTerm,
    TResult Function(String term, bool friend)? searchUsernamesByTerm,
    TResult Function(List<String> ids, bool withGameIds)? getRealtimeStatus,
    TResult Function()? getTop10Players,
    TResult Function(PerfType perfType, int nb)? getChessVariantLeaderboard,
    TResult Function(String username, bool trophies)? getPublicData,
    TResult Function(String username)? getRatingHistory,
    TResult Function(List<String> ids)? getManyByIds,
    TResult Function()? getLiveStreamers,
    required TResult orElse(),
  }) {
    if (getPublicData != null) {
      return getPublicData(username, trophies);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchUsersByTermEvent value) searchUsersByTerm,
    required TResult Function(SearchUsernamesByTermEvent value)
        searchUsernamesByTerm,
    required TResult Function(GetRealtimeStatusEvent value) getRealtimeStatus,
    required TResult Function(GetTop10PlayersEvent value) getTop10Players,
    required TResult Function(GetChessVariantLeaderboardEvent value)
        getChessVariantLeaderboard,
    required TResult Function(GetPublicDataEvent value) getPublicData,
    required TResult Function(GetRatingHistoryEvent value) getRatingHistory,
    required TResult Function(GetManyByIdsEvent value) getManyByIds,
    required TResult Function(GetLiveStreamersEvent value) getLiveStreamers,
  }) {
    return getPublicData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchUsersByTermEvent value)? searchUsersByTerm,
    TResult? Function(SearchUsernamesByTermEvent value)? searchUsernamesByTerm,
    TResult? Function(GetRealtimeStatusEvent value)? getRealtimeStatus,
    TResult? Function(GetTop10PlayersEvent value)? getTop10Players,
    TResult? Function(GetChessVariantLeaderboardEvent value)?
        getChessVariantLeaderboard,
    TResult? Function(GetPublicDataEvent value)? getPublicData,
    TResult? Function(GetRatingHistoryEvent value)? getRatingHistory,
    TResult? Function(GetManyByIdsEvent value)? getManyByIds,
    TResult? Function(GetLiveStreamersEvent value)? getLiveStreamers,
  }) {
    return getPublicData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchUsersByTermEvent value)? searchUsersByTerm,
    TResult Function(SearchUsernamesByTermEvent value)? searchUsernamesByTerm,
    TResult Function(GetRealtimeStatusEvent value)? getRealtimeStatus,
    TResult Function(GetTop10PlayersEvent value)? getTop10Players,
    TResult Function(GetChessVariantLeaderboardEvent value)?
        getChessVariantLeaderboard,
    TResult Function(GetPublicDataEvent value)? getPublicData,
    TResult Function(GetRatingHistoryEvent value)? getRatingHistory,
    TResult Function(GetManyByIdsEvent value)? getManyByIds,
    TResult Function(GetLiveStreamersEvent value)? getLiveStreamers,
    required TResult orElse(),
  }) {
    if (getPublicData != null) {
      return getPublicData(this);
    }
    return orElse();
  }
}

abstract class GetPublicDataEvent implements UserEvent {
  const factory GetPublicDataEvent(
      {required final String username,
      final bool trophies}) = _$GetPublicDataEvent;

  String get username;
  bool get trophies;
  @JsonKey(ignore: true)
  _$$GetPublicDataEventCopyWith<_$GetPublicDataEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetRatingHistoryEventCopyWith<$Res> {
  factory _$$GetRatingHistoryEventCopyWith(_$GetRatingHistoryEvent value,
          $Res Function(_$GetRatingHistoryEvent) then) =
      __$$GetRatingHistoryEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$$GetRatingHistoryEventCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetRatingHistoryEvent>
    implements _$$GetRatingHistoryEventCopyWith<$Res> {
  __$$GetRatingHistoryEventCopyWithImpl(_$GetRatingHistoryEvent _value,
      $Res Function(_$GetRatingHistoryEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_$GetRatingHistoryEvent(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetRatingHistoryEvent
    with DiagnosticableTreeMixin
    implements GetRatingHistoryEvent {
  const _$GetRatingHistoryEvent({required this.username});

  @override
  final String username;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.getRatingHistory(username: $username)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEvent.getRatingHistory'))
      ..add(DiagnosticsProperty('username', username));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRatingHistoryEvent &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRatingHistoryEventCopyWith<_$GetRatingHistoryEvent> get copyWith =>
      __$$GetRatingHistoryEventCopyWithImpl<_$GetRatingHistoryEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String term, bool friend) searchUsersByTerm,
    required TResult Function(String term, bool friend) searchUsernamesByTerm,
    required TResult Function(List<String> ids, bool withGameIds)
        getRealtimeStatus,
    required TResult Function() getTop10Players,
    required TResult Function(PerfType perfType, int nb)
        getChessVariantLeaderboard,
    required TResult Function(String username, bool trophies) getPublicData,
    required TResult Function(String username) getRatingHistory,
    required TResult Function(List<String> ids) getManyByIds,
    required TResult Function() getLiveStreamers,
  }) {
    return getRatingHistory(username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String term, bool friend)? searchUsersByTerm,
    TResult? Function(String term, bool friend)? searchUsernamesByTerm,
    TResult? Function(List<String> ids, bool withGameIds)? getRealtimeStatus,
    TResult? Function()? getTop10Players,
    TResult? Function(PerfType perfType, int nb)? getChessVariantLeaderboard,
    TResult? Function(String username, bool trophies)? getPublicData,
    TResult? Function(String username)? getRatingHistory,
    TResult? Function(List<String> ids)? getManyByIds,
    TResult? Function()? getLiveStreamers,
  }) {
    return getRatingHistory?.call(username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String term, bool friend)? searchUsersByTerm,
    TResult Function(String term, bool friend)? searchUsernamesByTerm,
    TResult Function(List<String> ids, bool withGameIds)? getRealtimeStatus,
    TResult Function()? getTop10Players,
    TResult Function(PerfType perfType, int nb)? getChessVariantLeaderboard,
    TResult Function(String username, bool trophies)? getPublicData,
    TResult Function(String username)? getRatingHistory,
    TResult Function(List<String> ids)? getManyByIds,
    TResult Function()? getLiveStreamers,
    required TResult orElse(),
  }) {
    if (getRatingHistory != null) {
      return getRatingHistory(username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchUsersByTermEvent value) searchUsersByTerm,
    required TResult Function(SearchUsernamesByTermEvent value)
        searchUsernamesByTerm,
    required TResult Function(GetRealtimeStatusEvent value) getRealtimeStatus,
    required TResult Function(GetTop10PlayersEvent value) getTop10Players,
    required TResult Function(GetChessVariantLeaderboardEvent value)
        getChessVariantLeaderboard,
    required TResult Function(GetPublicDataEvent value) getPublicData,
    required TResult Function(GetRatingHistoryEvent value) getRatingHistory,
    required TResult Function(GetManyByIdsEvent value) getManyByIds,
    required TResult Function(GetLiveStreamersEvent value) getLiveStreamers,
  }) {
    return getRatingHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchUsersByTermEvent value)? searchUsersByTerm,
    TResult? Function(SearchUsernamesByTermEvent value)? searchUsernamesByTerm,
    TResult? Function(GetRealtimeStatusEvent value)? getRealtimeStatus,
    TResult? Function(GetTop10PlayersEvent value)? getTop10Players,
    TResult? Function(GetChessVariantLeaderboardEvent value)?
        getChessVariantLeaderboard,
    TResult? Function(GetPublicDataEvent value)? getPublicData,
    TResult? Function(GetRatingHistoryEvent value)? getRatingHistory,
    TResult? Function(GetManyByIdsEvent value)? getManyByIds,
    TResult? Function(GetLiveStreamersEvent value)? getLiveStreamers,
  }) {
    return getRatingHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchUsersByTermEvent value)? searchUsersByTerm,
    TResult Function(SearchUsernamesByTermEvent value)? searchUsernamesByTerm,
    TResult Function(GetRealtimeStatusEvent value)? getRealtimeStatus,
    TResult Function(GetTop10PlayersEvent value)? getTop10Players,
    TResult Function(GetChessVariantLeaderboardEvent value)?
        getChessVariantLeaderboard,
    TResult Function(GetPublicDataEvent value)? getPublicData,
    TResult Function(GetRatingHistoryEvent value)? getRatingHistory,
    TResult Function(GetManyByIdsEvent value)? getManyByIds,
    TResult Function(GetLiveStreamersEvent value)? getLiveStreamers,
    required TResult orElse(),
  }) {
    if (getRatingHistory != null) {
      return getRatingHistory(this);
    }
    return orElse();
  }
}

abstract class GetRatingHistoryEvent implements UserEvent {
  const factory GetRatingHistoryEvent({required final String username}) =
      _$GetRatingHistoryEvent;

  String get username;
  @JsonKey(ignore: true)
  _$$GetRatingHistoryEventCopyWith<_$GetRatingHistoryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetManyByIdsEventCopyWith<$Res> {
  factory _$$GetManyByIdsEventCopyWith(
          _$GetManyByIdsEvent value, $Res Function(_$GetManyByIdsEvent) then) =
      __$$GetManyByIdsEventCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> ids});
}

/// @nodoc
class __$$GetManyByIdsEventCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetManyByIdsEvent>
    implements _$$GetManyByIdsEventCopyWith<$Res> {
  __$$GetManyByIdsEventCopyWithImpl(
      _$GetManyByIdsEvent _value, $Res Function(_$GetManyByIdsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ids = null,
  }) {
    return _then(_$GetManyByIdsEvent(
      ids: null == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$GetManyByIdsEvent
    with DiagnosticableTreeMixin
    implements GetManyByIdsEvent {
  const _$GetManyByIdsEvent({required final List<String> ids}) : _ids = ids;

  final List<String> _ids;
  @override
  List<String> get ids {
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ids);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.getManyByIds(ids: $ids)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEvent.getManyByIds'))
      ..add(DiagnosticsProperty('ids', ids));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetManyByIdsEvent &&
            const DeepCollectionEquality().equals(other._ids, _ids));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_ids));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetManyByIdsEventCopyWith<_$GetManyByIdsEvent> get copyWith =>
      __$$GetManyByIdsEventCopyWithImpl<_$GetManyByIdsEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String term, bool friend) searchUsersByTerm,
    required TResult Function(String term, bool friend) searchUsernamesByTerm,
    required TResult Function(List<String> ids, bool withGameIds)
        getRealtimeStatus,
    required TResult Function() getTop10Players,
    required TResult Function(PerfType perfType, int nb)
        getChessVariantLeaderboard,
    required TResult Function(String username, bool trophies) getPublicData,
    required TResult Function(String username) getRatingHistory,
    required TResult Function(List<String> ids) getManyByIds,
    required TResult Function() getLiveStreamers,
  }) {
    return getManyByIds(ids);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String term, bool friend)? searchUsersByTerm,
    TResult? Function(String term, bool friend)? searchUsernamesByTerm,
    TResult? Function(List<String> ids, bool withGameIds)? getRealtimeStatus,
    TResult? Function()? getTop10Players,
    TResult? Function(PerfType perfType, int nb)? getChessVariantLeaderboard,
    TResult? Function(String username, bool trophies)? getPublicData,
    TResult? Function(String username)? getRatingHistory,
    TResult? Function(List<String> ids)? getManyByIds,
    TResult? Function()? getLiveStreamers,
  }) {
    return getManyByIds?.call(ids);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String term, bool friend)? searchUsersByTerm,
    TResult Function(String term, bool friend)? searchUsernamesByTerm,
    TResult Function(List<String> ids, bool withGameIds)? getRealtimeStatus,
    TResult Function()? getTop10Players,
    TResult Function(PerfType perfType, int nb)? getChessVariantLeaderboard,
    TResult Function(String username, bool trophies)? getPublicData,
    TResult Function(String username)? getRatingHistory,
    TResult Function(List<String> ids)? getManyByIds,
    TResult Function()? getLiveStreamers,
    required TResult orElse(),
  }) {
    if (getManyByIds != null) {
      return getManyByIds(ids);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchUsersByTermEvent value) searchUsersByTerm,
    required TResult Function(SearchUsernamesByTermEvent value)
        searchUsernamesByTerm,
    required TResult Function(GetRealtimeStatusEvent value) getRealtimeStatus,
    required TResult Function(GetTop10PlayersEvent value) getTop10Players,
    required TResult Function(GetChessVariantLeaderboardEvent value)
        getChessVariantLeaderboard,
    required TResult Function(GetPublicDataEvent value) getPublicData,
    required TResult Function(GetRatingHistoryEvent value) getRatingHistory,
    required TResult Function(GetManyByIdsEvent value) getManyByIds,
    required TResult Function(GetLiveStreamersEvent value) getLiveStreamers,
  }) {
    return getManyByIds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchUsersByTermEvent value)? searchUsersByTerm,
    TResult? Function(SearchUsernamesByTermEvent value)? searchUsernamesByTerm,
    TResult? Function(GetRealtimeStatusEvent value)? getRealtimeStatus,
    TResult? Function(GetTop10PlayersEvent value)? getTop10Players,
    TResult? Function(GetChessVariantLeaderboardEvent value)?
        getChessVariantLeaderboard,
    TResult? Function(GetPublicDataEvent value)? getPublicData,
    TResult? Function(GetRatingHistoryEvent value)? getRatingHistory,
    TResult? Function(GetManyByIdsEvent value)? getManyByIds,
    TResult? Function(GetLiveStreamersEvent value)? getLiveStreamers,
  }) {
    return getManyByIds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchUsersByTermEvent value)? searchUsersByTerm,
    TResult Function(SearchUsernamesByTermEvent value)? searchUsernamesByTerm,
    TResult Function(GetRealtimeStatusEvent value)? getRealtimeStatus,
    TResult Function(GetTop10PlayersEvent value)? getTop10Players,
    TResult Function(GetChessVariantLeaderboardEvent value)?
        getChessVariantLeaderboard,
    TResult Function(GetPublicDataEvent value)? getPublicData,
    TResult Function(GetRatingHistoryEvent value)? getRatingHistory,
    TResult Function(GetManyByIdsEvent value)? getManyByIds,
    TResult Function(GetLiveStreamersEvent value)? getLiveStreamers,
    required TResult orElse(),
  }) {
    if (getManyByIds != null) {
      return getManyByIds(this);
    }
    return orElse();
  }
}

abstract class GetManyByIdsEvent implements UserEvent {
  const factory GetManyByIdsEvent({required final List<String> ids}) =
      _$GetManyByIdsEvent;

  List<String> get ids;
  @JsonKey(ignore: true)
  _$$GetManyByIdsEventCopyWith<_$GetManyByIdsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetLiveStreamersEventCopyWith<$Res> {
  factory _$$GetLiveStreamersEventCopyWith(_$GetLiveStreamersEvent value,
          $Res Function(_$GetLiveStreamersEvent) then) =
      __$$GetLiveStreamersEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLiveStreamersEventCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetLiveStreamersEvent>
    implements _$$GetLiveStreamersEventCopyWith<$Res> {
  __$$GetLiveStreamersEventCopyWithImpl(_$GetLiveStreamersEvent _value,
      $Res Function(_$GetLiveStreamersEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetLiveStreamersEvent
    with DiagnosticableTreeMixin
    implements GetLiveStreamersEvent {
  const _$GetLiveStreamersEvent();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.getLiveStreamers()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'UserEvent.getLiveStreamers'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetLiveStreamersEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String term, bool friend) searchUsersByTerm,
    required TResult Function(String term, bool friend) searchUsernamesByTerm,
    required TResult Function(List<String> ids, bool withGameIds)
        getRealtimeStatus,
    required TResult Function() getTop10Players,
    required TResult Function(PerfType perfType, int nb)
        getChessVariantLeaderboard,
    required TResult Function(String username, bool trophies) getPublicData,
    required TResult Function(String username) getRatingHistory,
    required TResult Function(List<String> ids) getManyByIds,
    required TResult Function() getLiveStreamers,
  }) {
    return getLiveStreamers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String term, bool friend)? searchUsersByTerm,
    TResult? Function(String term, bool friend)? searchUsernamesByTerm,
    TResult? Function(List<String> ids, bool withGameIds)? getRealtimeStatus,
    TResult? Function()? getTop10Players,
    TResult? Function(PerfType perfType, int nb)? getChessVariantLeaderboard,
    TResult? Function(String username, bool trophies)? getPublicData,
    TResult? Function(String username)? getRatingHistory,
    TResult? Function(List<String> ids)? getManyByIds,
    TResult? Function()? getLiveStreamers,
  }) {
    return getLiveStreamers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String term, bool friend)? searchUsersByTerm,
    TResult Function(String term, bool friend)? searchUsernamesByTerm,
    TResult Function(List<String> ids, bool withGameIds)? getRealtimeStatus,
    TResult Function()? getTop10Players,
    TResult Function(PerfType perfType, int nb)? getChessVariantLeaderboard,
    TResult Function(String username, bool trophies)? getPublicData,
    TResult Function(String username)? getRatingHistory,
    TResult Function(List<String> ids)? getManyByIds,
    TResult Function()? getLiveStreamers,
    required TResult orElse(),
  }) {
    if (getLiveStreamers != null) {
      return getLiveStreamers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchUsersByTermEvent value) searchUsersByTerm,
    required TResult Function(SearchUsernamesByTermEvent value)
        searchUsernamesByTerm,
    required TResult Function(GetRealtimeStatusEvent value) getRealtimeStatus,
    required TResult Function(GetTop10PlayersEvent value) getTop10Players,
    required TResult Function(GetChessVariantLeaderboardEvent value)
        getChessVariantLeaderboard,
    required TResult Function(GetPublicDataEvent value) getPublicData,
    required TResult Function(GetRatingHistoryEvent value) getRatingHistory,
    required TResult Function(GetManyByIdsEvent value) getManyByIds,
    required TResult Function(GetLiveStreamersEvent value) getLiveStreamers,
  }) {
    return getLiveStreamers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchUsersByTermEvent value)? searchUsersByTerm,
    TResult? Function(SearchUsernamesByTermEvent value)? searchUsernamesByTerm,
    TResult? Function(GetRealtimeStatusEvent value)? getRealtimeStatus,
    TResult? Function(GetTop10PlayersEvent value)? getTop10Players,
    TResult? Function(GetChessVariantLeaderboardEvent value)?
        getChessVariantLeaderboard,
    TResult? Function(GetPublicDataEvent value)? getPublicData,
    TResult? Function(GetRatingHistoryEvent value)? getRatingHistory,
    TResult? Function(GetManyByIdsEvent value)? getManyByIds,
    TResult? Function(GetLiveStreamersEvent value)? getLiveStreamers,
  }) {
    return getLiveStreamers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchUsersByTermEvent value)? searchUsersByTerm,
    TResult Function(SearchUsernamesByTermEvent value)? searchUsernamesByTerm,
    TResult Function(GetRealtimeStatusEvent value)? getRealtimeStatus,
    TResult Function(GetTop10PlayersEvent value)? getTop10Players,
    TResult Function(GetChessVariantLeaderboardEvent value)?
        getChessVariantLeaderboard,
    TResult Function(GetPublicDataEvent value)? getPublicData,
    TResult Function(GetRatingHistoryEvent value)? getRatingHistory,
    TResult Function(GetManyByIdsEvent value)? getManyByIds,
    TResult Function(GetLiveStreamersEvent value)? getLiveStreamers,
    required TResult orElse(),
  }) {
    if (getLiveStreamers != null) {
      return getLiveStreamers(this);
    }
    return orElse();
  }
}

abstract class GetLiveStreamersEvent implements UserEvent {
  const factory GetLiveStreamersEvent() = _$GetLiveStreamersEvent;
}
