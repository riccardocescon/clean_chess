// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TeamState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Team> teams) teamsByUserId,
    required TResult Function(Team team) teamById,
    required TResult Function(List<User> teamMembers) teamMembers,
    required TResult Function(List<JoinRequest> joinRequests) joinRequests,
    required TResult Function() joinRequestAccepted,
    required TResult Function() joinRequestRejected,
    required TResult Function() memberKicked,
    required TResult Function() joinedTeam,
    required TResult Function() leftTeam,
    required TResult Function() messagedAllMembers,
    required TResult Function(PageOf<Team> teams) teamSearchedByName,
    required TResult Function(PageOf<Team> teams) popularTeams,
    required TResult Function(Failure error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Team> teams)? teamsByUserId,
    TResult? Function(Team team)? teamById,
    TResult? Function(List<User> teamMembers)? teamMembers,
    TResult? Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult? Function()? joinRequestAccepted,
    TResult? Function()? joinRequestRejected,
    TResult? Function()? memberKicked,
    TResult? Function()? joinedTeam,
    TResult? Function()? leftTeam,
    TResult? Function()? messagedAllMembers,
    TResult? Function(PageOf<Team> teams)? teamSearchedByName,
    TResult? Function(PageOf<Team> teams)? popularTeams,
    TResult? Function(Failure error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Team> teams)? teamsByUserId,
    TResult Function(Team team)? teamById,
    TResult Function(List<User> teamMembers)? teamMembers,
    TResult Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult Function()? joinRequestAccepted,
    TResult Function()? joinRequestRejected,
    TResult Function()? memberKicked,
    TResult Function()? joinedTeam,
    TResult Function()? leftTeam,
    TResult Function()? messagedAllMembers,
    TResult Function(PageOf<Team> teams)? teamSearchedByName,
    TResult Function(PageOf<Team> teams)? popularTeams,
    TResult Function(Failure error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTeamStats value) initial,
    required TResult Function(_LoadingTeamStats value) loading,
    required TResult Function(_TeamsByUserIdTeamStats value) teamsByUserId,
    required TResult Function(_TeamByIdTeamStats value) teamById,
    required TResult Function(_TeamMembers value) teamMembers,
    required TResult Function(_JoinRequests value) joinRequests,
    required TResult Function(_JoinRequestAccepted value) joinRequestAccepted,
    required TResult Function(_JoinRequestRejected value) joinRequestRejected,
    required TResult Function(_MemberKicked value) memberKicked,
    required TResult Function(_JoinedTeam value) joinedTeam,
    required TResult Function(_LeftTeam value) leftTeam,
    required TResult Function(_MessagedAllMembers value) messagedAllMembers,
    required TResult Function(_TeamSearchedByName value) teamSearchedByName,
    required TResult Function(_PopularTeams value) popularTeams,
    required TResult Function(_ErrorTeamStats value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTeamStats value)? initial,
    TResult? Function(_LoadingTeamStats value)? loading,
    TResult? Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult? Function(_TeamByIdTeamStats value)? teamById,
    TResult? Function(_TeamMembers value)? teamMembers,
    TResult? Function(_JoinRequests value)? joinRequests,
    TResult? Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult? Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult? Function(_MemberKicked value)? memberKicked,
    TResult? Function(_JoinedTeam value)? joinedTeam,
    TResult? Function(_LeftTeam value)? leftTeam,
    TResult? Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult? Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult? Function(_PopularTeams value)? popularTeams,
    TResult? Function(_ErrorTeamStats value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTeamStats value)? initial,
    TResult Function(_LoadingTeamStats value)? loading,
    TResult Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult Function(_TeamByIdTeamStats value)? teamById,
    TResult Function(_TeamMembers value)? teamMembers,
    TResult Function(_JoinRequests value)? joinRequests,
    TResult Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult Function(_MemberKicked value)? memberKicked,
    TResult Function(_JoinedTeam value)? joinedTeam,
    TResult Function(_LeftTeam value)? leftTeam,
    TResult Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult Function(_PopularTeams value)? popularTeams,
    TResult Function(_ErrorTeamStats value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamStateCopyWith<$Res> {
  factory $TeamStateCopyWith(TeamState value, $Res Function(TeamState) then) =
      _$TeamStateCopyWithImpl<$Res, TeamState>;
}

/// @nodoc
class _$TeamStateCopyWithImpl<$Res, $Val extends TeamState>
    implements $TeamStateCopyWith<$Res> {
  _$TeamStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialTeamStatsCopyWith<$Res> {
  factory _$$_InitialTeamStatsCopyWith(
          _$_InitialTeamStats value, $Res Function(_$_InitialTeamStats) then) =
      __$$_InitialTeamStatsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialTeamStatsCopyWithImpl<$Res>
    extends _$TeamStateCopyWithImpl<$Res, _$_InitialTeamStats>
    implements _$$_InitialTeamStatsCopyWith<$Res> {
  __$$_InitialTeamStatsCopyWithImpl(
      _$_InitialTeamStats _value, $Res Function(_$_InitialTeamStats) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InitialTeamStats extends _InitialTeamStats {
  const _$_InitialTeamStats() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Team> teams) teamsByUserId,
    required TResult Function(Team team) teamById,
    required TResult Function(List<User> teamMembers) teamMembers,
    required TResult Function(List<JoinRequest> joinRequests) joinRequests,
    required TResult Function() joinRequestAccepted,
    required TResult Function() joinRequestRejected,
    required TResult Function() memberKicked,
    required TResult Function() joinedTeam,
    required TResult Function() leftTeam,
    required TResult Function() messagedAllMembers,
    required TResult Function(PageOf<Team> teams) teamSearchedByName,
    required TResult Function(PageOf<Team> teams) popularTeams,
    required TResult Function(Failure error) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Team> teams)? teamsByUserId,
    TResult? Function(Team team)? teamById,
    TResult? Function(List<User> teamMembers)? teamMembers,
    TResult? Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult? Function()? joinRequestAccepted,
    TResult? Function()? joinRequestRejected,
    TResult? Function()? memberKicked,
    TResult? Function()? joinedTeam,
    TResult? Function()? leftTeam,
    TResult? Function()? messagedAllMembers,
    TResult? Function(PageOf<Team> teams)? teamSearchedByName,
    TResult? Function(PageOf<Team> teams)? popularTeams,
    TResult? Function(Failure error)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Team> teams)? teamsByUserId,
    TResult Function(Team team)? teamById,
    TResult Function(List<User> teamMembers)? teamMembers,
    TResult Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult Function()? joinRequestAccepted,
    TResult Function()? joinRequestRejected,
    TResult Function()? memberKicked,
    TResult Function()? joinedTeam,
    TResult Function()? leftTeam,
    TResult Function()? messagedAllMembers,
    TResult Function(PageOf<Team> teams)? teamSearchedByName,
    TResult Function(PageOf<Team> teams)? popularTeams,
    TResult Function(Failure error)? failure,
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
    required TResult Function(_InitialTeamStats value) initial,
    required TResult Function(_LoadingTeamStats value) loading,
    required TResult Function(_TeamsByUserIdTeamStats value) teamsByUserId,
    required TResult Function(_TeamByIdTeamStats value) teamById,
    required TResult Function(_TeamMembers value) teamMembers,
    required TResult Function(_JoinRequests value) joinRequests,
    required TResult Function(_JoinRequestAccepted value) joinRequestAccepted,
    required TResult Function(_JoinRequestRejected value) joinRequestRejected,
    required TResult Function(_MemberKicked value) memberKicked,
    required TResult Function(_JoinedTeam value) joinedTeam,
    required TResult Function(_LeftTeam value) leftTeam,
    required TResult Function(_MessagedAllMembers value) messagedAllMembers,
    required TResult Function(_TeamSearchedByName value) teamSearchedByName,
    required TResult Function(_PopularTeams value) popularTeams,
    required TResult Function(_ErrorTeamStats value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTeamStats value)? initial,
    TResult? Function(_LoadingTeamStats value)? loading,
    TResult? Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult? Function(_TeamByIdTeamStats value)? teamById,
    TResult? Function(_TeamMembers value)? teamMembers,
    TResult? Function(_JoinRequests value)? joinRequests,
    TResult? Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult? Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult? Function(_MemberKicked value)? memberKicked,
    TResult? Function(_JoinedTeam value)? joinedTeam,
    TResult? Function(_LeftTeam value)? leftTeam,
    TResult? Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult? Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult? Function(_PopularTeams value)? popularTeams,
    TResult? Function(_ErrorTeamStats value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTeamStats value)? initial,
    TResult Function(_LoadingTeamStats value)? loading,
    TResult Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult Function(_TeamByIdTeamStats value)? teamById,
    TResult Function(_TeamMembers value)? teamMembers,
    TResult Function(_JoinRequests value)? joinRequests,
    TResult Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult Function(_MemberKicked value)? memberKicked,
    TResult Function(_JoinedTeam value)? joinedTeam,
    TResult Function(_LeftTeam value)? leftTeam,
    TResult Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult Function(_PopularTeams value)? popularTeams,
    TResult Function(_ErrorTeamStats value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialTeamStats extends TeamState {
  const factory _InitialTeamStats() = _$_InitialTeamStats;
  const _InitialTeamStats._() : super._();
}

/// @nodoc
abstract class _$$_LoadingTeamStatsCopyWith<$Res> {
  factory _$$_LoadingTeamStatsCopyWith(
          _$_LoadingTeamStats value, $Res Function(_$_LoadingTeamStats) then) =
      __$$_LoadingTeamStatsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingTeamStatsCopyWithImpl<$Res>
    extends _$TeamStateCopyWithImpl<$Res, _$_LoadingTeamStats>
    implements _$$_LoadingTeamStatsCopyWith<$Res> {
  __$$_LoadingTeamStatsCopyWithImpl(
      _$_LoadingTeamStats _value, $Res Function(_$_LoadingTeamStats) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadingTeamStats extends _LoadingTeamStats {
  const _$_LoadingTeamStats() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Team> teams) teamsByUserId,
    required TResult Function(Team team) teamById,
    required TResult Function(List<User> teamMembers) teamMembers,
    required TResult Function(List<JoinRequest> joinRequests) joinRequests,
    required TResult Function() joinRequestAccepted,
    required TResult Function() joinRequestRejected,
    required TResult Function() memberKicked,
    required TResult Function() joinedTeam,
    required TResult Function() leftTeam,
    required TResult Function() messagedAllMembers,
    required TResult Function(PageOf<Team> teams) teamSearchedByName,
    required TResult Function(PageOf<Team> teams) popularTeams,
    required TResult Function(Failure error) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Team> teams)? teamsByUserId,
    TResult? Function(Team team)? teamById,
    TResult? Function(List<User> teamMembers)? teamMembers,
    TResult? Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult? Function()? joinRequestAccepted,
    TResult? Function()? joinRequestRejected,
    TResult? Function()? memberKicked,
    TResult? Function()? joinedTeam,
    TResult? Function()? leftTeam,
    TResult? Function()? messagedAllMembers,
    TResult? Function(PageOf<Team> teams)? teamSearchedByName,
    TResult? Function(PageOf<Team> teams)? popularTeams,
    TResult? Function(Failure error)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Team> teams)? teamsByUserId,
    TResult Function(Team team)? teamById,
    TResult Function(List<User> teamMembers)? teamMembers,
    TResult Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult Function()? joinRequestAccepted,
    TResult Function()? joinRequestRejected,
    TResult Function()? memberKicked,
    TResult Function()? joinedTeam,
    TResult Function()? leftTeam,
    TResult Function()? messagedAllMembers,
    TResult Function(PageOf<Team> teams)? teamSearchedByName,
    TResult Function(PageOf<Team> teams)? popularTeams,
    TResult Function(Failure error)? failure,
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
    required TResult Function(_InitialTeamStats value) initial,
    required TResult Function(_LoadingTeamStats value) loading,
    required TResult Function(_TeamsByUserIdTeamStats value) teamsByUserId,
    required TResult Function(_TeamByIdTeamStats value) teamById,
    required TResult Function(_TeamMembers value) teamMembers,
    required TResult Function(_JoinRequests value) joinRequests,
    required TResult Function(_JoinRequestAccepted value) joinRequestAccepted,
    required TResult Function(_JoinRequestRejected value) joinRequestRejected,
    required TResult Function(_MemberKicked value) memberKicked,
    required TResult Function(_JoinedTeam value) joinedTeam,
    required TResult Function(_LeftTeam value) leftTeam,
    required TResult Function(_MessagedAllMembers value) messagedAllMembers,
    required TResult Function(_TeamSearchedByName value) teamSearchedByName,
    required TResult Function(_PopularTeams value) popularTeams,
    required TResult Function(_ErrorTeamStats value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTeamStats value)? initial,
    TResult? Function(_LoadingTeamStats value)? loading,
    TResult? Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult? Function(_TeamByIdTeamStats value)? teamById,
    TResult? Function(_TeamMembers value)? teamMembers,
    TResult? Function(_JoinRequests value)? joinRequests,
    TResult? Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult? Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult? Function(_MemberKicked value)? memberKicked,
    TResult? Function(_JoinedTeam value)? joinedTeam,
    TResult? Function(_LeftTeam value)? leftTeam,
    TResult? Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult? Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult? Function(_PopularTeams value)? popularTeams,
    TResult? Function(_ErrorTeamStats value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTeamStats value)? initial,
    TResult Function(_LoadingTeamStats value)? loading,
    TResult Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult Function(_TeamByIdTeamStats value)? teamById,
    TResult Function(_TeamMembers value)? teamMembers,
    TResult Function(_JoinRequests value)? joinRequests,
    TResult Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult Function(_MemberKicked value)? memberKicked,
    TResult Function(_JoinedTeam value)? joinedTeam,
    TResult Function(_LeftTeam value)? leftTeam,
    TResult Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult Function(_PopularTeams value)? popularTeams,
    TResult Function(_ErrorTeamStats value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingTeamStats extends TeamState {
  const factory _LoadingTeamStats() = _$_LoadingTeamStats;
  const _LoadingTeamStats._() : super._();
}

/// @nodoc
abstract class _$$_TeamsByUserIdTeamStatsCopyWith<$Res> {
  factory _$$_TeamsByUserIdTeamStatsCopyWith(_$_TeamsByUserIdTeamStats value,
          $Res Function(_$_TeamsByUserIdTeamStats) then) =
      __$$_TeamsByUserIdTeamStatsCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Team> teams});
}

/// @nodoc
class __$$_TeamsByUserIdTeamStatsCopyWithImpl<$Res>
    extends _$TeamStateCopyWithImpl<$Res, _$_TeamsByUserIdTeamStats>
    implements _$$_TeamsByUserIdTeamStatsCopyWith<$Res> {
  __$$_TeamsByUserIdTeamStatsCopyWithImpl(_$_TeamsByUserIdTeamStats _value,
      $Res Function(_$_TeamsByUserIdTeamStats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teams = null,
  }) {
    return _then(_$_TeamsByUserIdTeamStats(
      null == teams
          ? _value._teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<Team>,
    ));
  }
}

/// @nodoc

class _$_TeamsByUserIdTeamStats extends _TeamsByUserIdTeamStats {
  const _$_TeamsByUserIdTeamStats(final List<Team> teams)
      : _teams = teams,
        super._();

  final List<Team> _teams;
  @override
  List<Team> get teams {
    if (_teams is EqualUnmodifiableListView) return _teams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teams);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TeamsByUserIdTeamStatsCopyWith<_$_TeamsByUserIdTeamStats> get copyWith =>
      __$$_TeamsByUserIdTeamStatsCopyWithImpl<_$_TeamsByUserIdTeamStats>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Team> teams) teamsByUserId,
    required TResult Function(Team team) teamById,
    required TResult Function(List<User> teamMembers) teamMembers,
    required TResult Function(List<JoinRequest> joinRequests) joinRequests,
    required TResult Function() joinRequestAccepted,
    required TResult Function() joinRequestRejected,
    required TResult Function() memberKicked,
    required TResult Function() joinedTeam,
    required TResult Function() leftTeam,
    required TResult Function() messagedAllMembers,
    required TResult Function(PageOf<Team> teams) teamSearchedByName,
    required TResult Function(PageOf<Team> teams) popularTeams,
    required TResult Function(Failure error) failure,
  }) {
    return teamsByUserId(teams);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Team> teams)? teamsByUserId,
    TResult? Function(Team team)? teamById,
    TResult? Function(List<User> teamMembers)? teamMembers,
    TResult? Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult? Function()? joinRequestAccepted,
    TResult? Function()? joinRequestRejected,
    TResult? Function()? memberKicked,
    TResult? Function()? joinedTeam,
    TResult? Function()? leftTeam,
    TResult? Function()? messagedAllMembers,
    TResult? Function(PageOf<Team> teams)? teamSearchedByName,
    TResult? Function(PageOf<Team> teams)? popularTeams,
    TResult? Function(Failure error)? failure,
  }) {
    return teamsByUserId?.call(teams);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Team> teams)? teamsByUserId,
    TResult Function(Team team)? teamById,
    TResult Function(List<User> teamMembers)? teamMembers,
    TResult Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult Function()? joinRequestAccepted,
    TResult Function()? joinRequestRejected,
    TResult Function()? memberKicked,
    TResult Function()? joinedTeam,
    TResult Function()? leftTeam,
    TResult Function()? messagedAllMembers,
    TResult Function(PageOf<Team> teams)? teamSearchedByName,
    TResult Function(PageOf<Team> teams)? popularTeams,
    TResult Function(Failure error)? failure,
    required TResult orElse(),
  }) {
    if (teamsByUserId != null) {
      return teamsByUserId(teams);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTeamStats value) initial,
    required TResult Function(_LoadingTeamStats value) loading,
    required TResult Function(_TeamsByUserIdTeamStats value) teamsByUserId,
    required TResult Function(_TeamByIdTeamStats value) teamById,
    required TResult Function(_TeamMembers value) teamMembers,
    required TResult Function(_JoinRequests value) joinRequests,
    required TResult Function(_JoinRequestAccepted value) joinRequestAccepted,
    required TResult Function(_JoinRequestRejected value) joinRequestRejected,
    required TResult Function(_MemberKicked value) memberKicked,
    required TResult Function(_JoinedTeam value) joinedTeam,
    required TResult Function(_LeftTeam value) leftTeam,
    required TResult Function(_MessagedAllMembers value) messagedAllMembers,
    required TResult Function(_TeamSearchedByName value) teamSearchedByName,
    required TResult Function(_PopularTeams value) popularTeams,
    required TResult Function(_ErrorTeamStats value) failure,
  }) {
    return teamsByUserId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTeamStats value)? initial,
    TResult? Function(_LoadingTeamStats value)? loading,
    TResult? Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult? Function(_TeamByIdTeamStats value)? teamById,
    TResult? Function(_TeamMembers value)? teamMembers,
    TResult? Function(_JoinRequests value)? joinRequests,
    TResult? Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult? Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult? Function(_MemberKicked value)? memberKicked,
    TResult? Function(_JoinedTeam value)? joinedTeam,
    TResult? Function(_LeftTeam value)? leftTeam,
    TResult? Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult? Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult? Function(_PopularTeams value)? popularTeams,
    TResult? Function(_ErrorTeamStats value)? failure,
  }) {
    return teamsByUserId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTeamStats value)? initial,
    TResult Function(_LoadingTeamStats value)? loading,
    TResult Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult Function(_TeamByIdTeamStats value)? teamById,
    TResult Function(_TeamMembers value)? teamMembers,
    TResult Function(_JoinRequests value)? joinRequests,
    TResult Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult Function(_MemberKicked value)? memberKicked,
    TResult Function(_JoinedTeam value)? joinedTeam,
    TResult Function(_LeftTeam value)? leftTeam,
    TResult Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult Function(_PopularTeams value)? popularTeams,
    TResult Function(_ErrorTeamStats value)? failure,
    required TResult orElse(),
  }) {
    if (teamsByUserId != null) {
      return teamsByUserId(this);
    }
    return orElse();
  }
}

abstract class _TeamsByUserIdTeamStats extends TeamState {
  const factory _TeamsByUserIdTeamStats(final List<Team> teams) =
      _$_TeamsByUserIdTeamStats;
  const _TeamsByUserIdTeamStats._() : super._();

  List<Team> get teams;
  @JsonKey(ignore: true)
  _$$_TeamsByUserIdTeamStatsCopyWith<_$_TeamsByUserIdTeamStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TeamByIdTeamStatsCopyWith<$Res> {
  factory _$$_TeamByIdTeamStatsCopyWith(_$_TeamByIdTeamStats value,
          $Res Function(_$_TeamByIdTeamStats) then) =
      __$$_TeamByIdTeamStatsCopyWithImpl<$Res>;
  @useResult
  $Res call({Team team});

  $TeamCopyWith<$Res> get team;
}

/// @nodoc
class __$$_TeamByIdTeamStatsCopyWithImpl<$Res>
    extends _$TeamStateCopyWithImpl<$Res, _$_TeamByIdTeamStats>
    implements _$$_TeamByIdTeamStatsCopyWith<$Res> {
  __$$_TeamByIdTeamStatsCopyWithImpl(
      _$_TeamByIdTeamStats _value, $Res Function(_$_TeamByIdTeamStats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team = null,
  }) {
    return _then(_$_TeamByIdTeamStats(
      null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TeamCopyWith<$Res> get team {
    return $TeamCopyWith<$Res>(_value.team, (value) {
      return _then(_value.copyWith(team: value));
    });
  }
}

/// @nodoc

class _$_TeamByIdTeamStats extends _TeamByIdTeamStats {
  const _$_TeamByIdTeamStats(this.team) : super._();

  @override
  final Team team;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TeamByIdTeamStatsCopyWith<_$_TeamByIdTeamStats> get copyWith =>
      __$$_TeamByIdTeamStatsCopyWithImpl<_$_TeamByIdTeamStats>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Team> teams) teamsByUserId,
    required TResult Function(Team team) teamById,
    required TResult Function(List<User> teamMembers) teamMembers,
    required TResult Function(List<JoinRequest> joinRequests) joinRequests,
    required TResult Function() joinRequestAccepted,
    required TResult Function() joinRequestRejected,
    required TResult Function() memberKicked,
    required TResult Function() joinedTeam,
    required TResult Function() leftTeam,
    required TResult Function() messagedAllMembers,
    required TResult Function(PageOf<Team> teams) teamSearchedByName,
    required TResult Function(PageOf<Team> teams) popularTeams,
    required TResult Function(Failure error) failure,
  }) {
    return teamById(team);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Team> teams)? teamsByUserId,
    TResult? Function(Team team)? teamById,
    TResult? Function(List<User> teamMembers)? teamMembers,
    TResult? Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult? Function()? joinRequestAccepted,
    TResult? Function()? joinRequestRejected,
    TResult? Function()? memberKicked,
    TResult? Function()? joinedTeam,
    TResult? Function()? leftTeam,
    TResult? Function()? messagedAllMembers,
    TResult? Function(PageOf<Team> teams)? teamSearchedByName,
    TResult? Function(PageOf<Team> teams)? popularTeams,
    TResult? Function(Failure error)? failure,
  }) {
    return teamById?.call(team);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Team> teams)? teamsByUserId,
    TResult Function(Team team)? teamById,
    TResult Function(List<User> teamMembers)? teamMembers,
    TResult Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult Function()? joinRequestAccepted,
    TResult Function()? joinRequestRejected,
    TResult Function()? memberKicked,
    TResult Function()? joinedTeam,
    TResult Function()? leftTeam,
    TResult Function()? messagedAllMembers,
    TResult Function(PageOf<Team> teams)? teamSearchedByName,
    TResult Function(PageOf<Team> teams)? popularTeams,
    TResult Function(Failure error)? failure,
    required TResult orElse(),
  }) {
    if (teamById != null) {
      return teamById(team);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTeamStats value) initial,
    required TResult Function(_LoadingTeamStats value) loading,
    required TResult Function(_TeamsByUserIdTeamStats value) teamsByUserId,
    required TResult Function(_TeamByIdTeamStats value) teamById,
    required TResult Function(_TeamMembers value) teamMembers,
    required TResult Function(_JoinRequests value) joinRequests,
    required TResult Function(_JoinRequestAccepted value) joinRequestAccepted,
    required TResult Function(_JoinRequestRejected value) joinRequestRejected,
    required TResult Function(_MemberKicked value) memberKicked,
    required TResult Function(_JoinedTeam value) joinedTeam,
    required TResult Function(_LeftTeam value) leftTeam,
    required TResult Function(_MessagedAllMembers value) messagedAllMembers,
    required TResult Function(_TeamSearchedByName value) teamSearchedByName,
    required TResult Function(_PopularTeams value) popularTeams,
    required TResult Function(_ErrorTeamStats value) failure,
  }) {
    return teamById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTeamStats value)? initial,
    TResult? Function(_LoadingTeamStats value)? loading,
    TResult? Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult? Function(_TeamByIdTeamStats value)? teamById,
    TResult? Function(_TeamMembers value)? teamMembers,
    TResult? Function(_JoinRequests value)? joinRequests,
    TResult? Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult? Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult? Function(_MemberKicked value)? memberKicked,
    TResult? Function(_JoinedTeam value)? joinedTeam,
    TResult? Function(_LeftTeam value)? leftTeam,
    TResult? Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult? Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult? Function(_PopularTeams value)? popularTeams,
    TResult? Function(_ErrorTeamStats value)? failure,
  }) {
    return teamById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTeamStats value)? initial,
    TResult Function(_LoadingTeamStats value)? loading,
    TResult Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult Function(_TeamByIdTeamStats value)? teamById,
    TResult Function(_TeamMembers value)? teamMembers,
    TResult Function(_JoinRequests value)? joinRequests,
    TResult Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult Function(_MemberKicked value)? memberKicked,
    TResult Function(_JoinedTeam value)? joinedTeam,
    TResult Function(_LeftTeam value)? leftTeam,
    TResult Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult Function(_PopularTeams value)? popularTeams,
    TResult Function(_ErrorTeamStats value)? failure,
    required TResult orElse(),
  }) {
    if (teamById != null) {
      return teamById(this);
    }
    return orElse();
  }
}

abstract class _TeamByIdTeamStats extends TeamState {
  const factory _TeamByIdTeamStats(final Team team) = _$_TeamByIdTeamStats;
  const _TeamByIdTeamStats._() : super._();

  Team get team;
  @JsonKey(ignore: true)
  _$$_TeamByIdTeamStatsCopyWith<_$_TeamByIdTeamStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TeamMembersCopyWith<$Res> {
  factory _$$_TeamMembersCopyWith(
          _$_TeamMembers value, $Res Function(_$_TeamMembers) then) =
      __$$_TeamMembersCopyWithImpl<$Res>;
  @useResult
  $Res call({List<User> teamMembers});
}

/// @nodoc
class __$$_TeamMembersCopyWithImpl<$Res>
    extends _$TeamStateCopyWithImpl<$Res, _$_TeamMembers>
    implements _$$_TeamMembersCopyWith<$Res> {
  __$$_TeamMembersCopyWithImpl(
      _$_TeamMembers _value, $Res Function(_$_TeamMembers) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamMembers = null,
  }) {
    return _then(_$_TeamMembers(
      null == teamMembers
          ? _value._teamMembers
          : teamMembers // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc

class _$_TeamMembers extends _TeamMembers {
  const _$_TeamMembers(final List<User> teamMembers)
      : _teamMembers = teamMembers,
        super._();

  final List<User> _teamMembers;
  @override
  List<User> get teamMembers {
    if (_teamMembers is EqualUnmodifiableListView) return _teamMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teamMembers);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TeamMembersCopyWith<_$_TeamMembers> get copyWith =>
      __$$_TeamMembersCopyWithImpl<_$_TeamMembers>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Team> teams) teamsByUserId,
    required TResult Function(Team team) teamById,
    required TResult Function(List<User> teamMembers) teamMembers,
    required TResult Function(List<JoinRequest> joinRequests) joinRequests,
    required TResult Function() joinRequestAccepted,
    required TResult Function() joinRequestRejected,
    required TResult Function() memberKicked,
    required TResult Function() joinedTeam,
    required TResult Function() leftTeam,
    required TResult Function() messagedAllMembers,
    required TResult Function(PageOf<Team> teams) teamSearchedByName,
    required TResult Function(PageOf<Team> teams) popularTeams,
    required TResult Function(Failure error) failure,
  }) {
    return teamMembers(this.teamMembers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Team> teams)? teamsByUserId,
    TResult? Function(Team team)? teamById,
    TResult? Function(List<User> teamMembers)? teamMembers,
    TResult? Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult? Function()? joinRequestAccepted,
    TResult? Function()? joinRequestRejected,
    TResult? Function()? memberKicked,
    TResult? Function()? joinedTeam,
    TResult? Function()? leftTeam,
    TResult? Function()? messagedAllMembers,
    TResult? Function(PageOf<Team> teams)? teamSearchedByName,
    TResult? Function(PageOf<Team> teams)? popularTeams,
    TResult? Function(Failure error)? failure,
  }) {
    return teamMembers?.call(this.teamMembers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Team> teams)? teamsByUserId,
    TResult Function(Team team)? teamById,
    TResult Function(List<User> teamMembers)? teamMembers,
    TResult Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult Function()? joinRequestAccepted,
    TResult Function()? joinRequestRejected,
    TResult Function()? memberKicked,
    TResult Function()? joinedTeam,
    TResult Function()? leftTeam,
    TResult Function()? messagedAllMembers,
    TResult Function(PageOf<Team> teams)? teamSearchedByName,
    TResult Function(PageOf<Team> teams)? popularTeams,
    TResult Function(Failure error)? failure,
    required TResult orElse(),
  }) {
    if (teamMembers != null) {
      return teamMembers(this.teamMembers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTeamStats value) initial,
    required TResult Function(_LoadingTeamStats value) loading,
    required TResult Function(_TeamsByUserIdTeamStats value) teamsByUserId,
    required TResult Function(_TeamByIdTeamStats value) teamById,
    required TResult Function(_TeamMembers value) teamMembers,
    required TResult Function(_JoinRequests value) joinRequests,
    required TResult Function(_JoinRequestAccepted value) joinRequestAccepted,
    required TResult Function(_JoinRequestRejected value) joinRequestRejected,
    required TResult Function(_MemberKicked value) memberKicked,
    required TResult Function(_JoinedTeam value) joinedTeam,
    required TResult Function(_LeftTeam value) leftTeam,
    required TResult Function(_MessagedAllMembers value) messagedAllMembers,
    required TResult Function(_TeamSearchedByName value) teamSearchedByName,
    required TResult Function(_PopularTeams value) popularTeams,
    required TResult Function(_ErrorTeamStats value) failure,
  }) {
    return teamMembers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTeamStats value)? initial,
    TResult? Function(_LoadingTeamStats value)? loading,
    TResult? Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult? Function(_TeamByIdTeamStats value)? teamById,
    TResult? Function(_TeamMembers value)? teamMembers,
    TResult? Function(_JoinRequests value)? joinRequests,
    TResult? Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult? Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult? Function(_MemberKicked value)? memberKicked,
    TResult? Function(_JoinedTeam value)? joinedTeam,
    TResult? Function(_LeftTeam value)? leftTeam,
    TResult? Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult? Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult? Function(_PopularTeams value)? popularTeams,
    TResult? Function(_ErrorTeamStats value)? failure,
  }) {
    return teamMembers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTeamStats value)? initial,
    TResult Function(_LoadingTeamStats value)? loading,
    TResult Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult Function(_TeamByIdTeamStats value)? teamById,
    TResult Function(_TeamMembers value)? teamMembers,
    TResult Function(_JoinRequests value)? joinRequests,
    TResult Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult Function(_MemberKicked value)? memberKicked,
    TResult Function(_JoinedTeam value)? joinedTeam,
    TResult Function(_LeftTeam value)? leftTeam,
    TResult Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult Function(_PopularTeams value)? popularTeams,
    TResult Function(_ErrorTeamStats value)? failure,
    required TResult orElse(),
  }) {
    if (teamMembers != null) {
      return teamMembers(this);
    }
    return orElse();
  }
}

abstract class _TeamMembers extends TeamState {
  const factory _TeamMembers(final List<User> teamMembers) = _$_TeamMembers;
  const _TeamMembers._() : super._();

  List<User> get teamMembers;
  @JsonKey(ignore: true)
  _$$_TeamMembersCopyWith<_$_TeamMembers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_JoinRequestsCopyWith<$Res> {
  factory _$$_JoinRequestsCopyWith(
          _$_JoinRequests value, $Res Function(_$_JoinRequests) then) =
      __$$_JoinRequestsCopyWithImpl<$Res>;
  @useResult
  $Res call({List<JoinRequest> joinRequests});
}

/// @nodoc
class __$$_JoinRequestsCopyWithImpl<$Res>
    extends _$TeamStateCopyWithImpl<$Res, _$_JoinRequests>
    implements _$$_JoinRequestsCopyWith<$Res> {
  __$$_JoinRequestsCopyWithImpl(
      _$_JoinRequests _value, $Res Function(_$_JoinRequests) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? joinRequests = null,
  }) {
    return _then(_$_JoinRequests(
      null == joinRequests
          ? _value._joinRequests
          : joinRequests // ignore: cast_nullable_to_non_nullable
              as List<JoinRequest>,
    ));
  }
}

/// @nodoc

class _$_JoinRequests extends _JoinRequests {
  const _$_JoinRequests(final List<JoinRequest> joinRequests)
      : _joinRequests = joinRequests,
        super._();

  final List<JoinRequest> _joinRequests;
  @override
  List<JoinRequest> get joinRequests {
    if (_joinRequests is EqualUnmodifiableListView) return _joinRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_joinRequests);
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JoinRequestsCopyWith<_$_JoinRequests> get copyWith =>
      __$$_JoinRequestsCopyWithImpl<_$_JoinRequests>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Team> teams) teamsByUserId,
    required TResult Function(Team team) teamById,
    required TResult Function(List<User> teamMembers) teamMembers,
    required TResult Function(List<JoinRequest> joinRequests) joinRequests,
    required TResult Function() joinRequestAccepted,
    required TResult Function() joinRequestRejected,
    required TResult Function() memberKicked,
    required TResult Function() joinedTeam,
    required TResult Function() leftTeam,
    required TResult Function() messagedAllMembers,
    required TResult Function(PageOf<Team> teams) teamSearchedByName,
    required TResult Function(PageOf<Team> teams) popularTeams,
    required TResult Function(Failure error) failure,
  }) {
    return joinRequests(this.joinRequests);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Team> teams)? teamsByUserId,
    TResult? Function(Team team)? teamById,
    TResult? Function(List<User> teamMembers)? teamMembers,
    TResult? Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult? Function()? joinRequestAccepted,
    TResult? Function()? joinRequestRejected,
    TResult? Function()? memberKicked,
    TResult? Function()? joinedTeam,
    TResult? Function()? leftTeam,
    TResult? Function()? messagedAllMembers,
    TResult? Function(PageOf<Team> teams)? teamSearchedByName,
    TResult? Function(PageOf<Team> teams)? popularTeams,
    TResult? Function(Failure error)? failure,
  }) {
    return joinRequests?.call(this.joinRequests);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Team> teams)? teamsByUserId,
    TResult Function(Team team)? teamById,
    TResult Function(List<User> teamMembers)? teamMembers,
    TResult Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult Function()? joinRequestAccepted,
    TResult Function()? joinRequestRejected,
    TResult Function()? memberKicked,
    TResult Function()? joinedTeam,
    TResult Function()? leftTeam,
    TResult Function()? messagedAllMembers,
    TResult Function(PageOf<Team> teams)? teamSearchedByName,
    TResult Function(PageOf<Team> teams)? popularTeams,
    TResult Function(Failure error)? failure,
    required TResult orElse(),
  }) {
    if (joinRequests != null) {
      return joinRequests(this.joinRequests);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTeamStats value) initial,
    required TResult Function(_LoadingTeamStats value) loading,
    required TResult Function(_TeamsByUserIdTeamStats value) teamsByUserId,
    required TResult Function(_TeamByIdTeamStats value) teamById,
    required TResult Function(_TeamMembers value) teamMembers,
    required TResult Function(_JoinRequests value) joinRequests,
    required TResult Function(_JoinRequestAccepted value) joinRequestAccepted,
    required TResult Function(_JoinRequestRejected value) joinRequestRejected,
    required TResult Function(_MemberKicked value) memberKicked,
    required TResult Function(_JoinedTeam value) joinedTeam,
    required TResult Function(_LeftTeam value) leftTeam,
    required TResult Function(_MessagedAllMembers value) messagedAllMembers,
    required TResult Function(_TeamSearchedByName value) teamSearchedByName,
    required TResult Function(_PopularTeams value) popularTeams,
    required TResult Function(_ErrorTeamStats value) failure,
  }) {
    return joinRequests(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTeamStats value)? initial,
    TResult? Function(_LoadingTeamStats value)? loading,
    TResult? Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult? Function(_TeamByIdTeamStats value)? teamById,
    TResult? Function(_TeamMembers value)? teamMembers,
    TResult? Function(_JoinRequests value)? joinRequests,
    TResult? Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult? Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult? Function(_MemberKicked value)? memberKicked,
    TResult? Function(_JoinedTeam value)? joinedTeam,
    TResult? Function(_LeftTeam value)? leftTeam,
    TResult? Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult? Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult? Function(_PopularTeams value)? popularTeams,
    TResult? Function(_ErrorTeamStats value)? failure,
  }) {
    return joinRequests?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTeamStats value)? initial,
    TResult Function(_LoadingTeamStats value)? loading,
    TResult Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult Function(_TeamByIdTeamStats value)? teamById,
    TResult Function(_TeamMembers value)? teamMembers,
    TResult Function(_JoinRequests value)? joinRequests,
    TResult Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult Function(_MemberKicked value)? memberKicked,
    TResult Function(_JoinedTeam value)? joinedTeam,
    TResult Function(_LeftTeam value)? leftTeam,
    TResult Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult Function(_PopularTeams value)? popularTeams,
    TResult Function(_ErrorTeamStats value)? failure,
    required TResult orElse(),
  }) {
    if (joinRequests != null) {
      return joinRequests(this);
    }
    return orElse();
  }
}

abstract class _JoinRequests extends TeamState {
  const factory _JoinRequests(final List<JoinRequest> joinRequests) =
      _$_JoinRequests;
  const _JoinRequests._() : super._();

  List<JoinRequest> get joinRequests;
  @JsonKey(ignore: true)
  _$$_JoinRequestsCopyWith<_$_JoinRequests> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_JoinRequestAcceptedCopyWith<$Res> {
  factory _$$_JoinRequestAcceptedCopyWith(_$_JoinRequestAccepted value,
          $Res Function(_$_JoinRequestAccepted) then) =
      __$$_JoinRequestAcceptedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_JoinRequestAcceptedCopyWithImpl<$Res>
    extends _$TeamStateCopyWithImpl<$Res, _$_JoinRequestAccepted>
    implements _$$_JoinRequestAcceptedCopyWith<$Res> {
  __$$_JoinRequestAcceptedCopyWithImpl(_$_JoinRequestAccepted _value,
      $Res Function(_$_JoinRequestAccepted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_JoinRequestAccepted extends _JoinRequestAccepted {
  const _$_JoinRequestAccepted() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Team> teams) teamsByUserId,
    required TResult Function(Team team) teamById,
    required TResult Function(List<User> teamMembers) teamMembers,
    required TResult Function(List<JoinRequest> joinRequests) joinRequests,
    required TResult Function() joinRequestAccepted,
    required TResult Function() joinRequestRejected,
    required TResult Function() memberKicked,
    required TResult Function() joinedTeam,
    required TResult Function() leftTeam,
    required TResult Function() messagedAllMembers,
    required TResult Function(PageOf<Team> teams) teamSearchedByName,
    required TResult Function(PageOf<Team> teams) popularTeams,
    required TResult Function(Failure error) failure,
  }) {
    return joinRequestAccepted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Team> teams)? teamsByUserId,
    TResult? Function(Team team)? teamById,
    TResult? Function(List<User> teamMembers)? teamMembers,
    TResult? Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult? Function()? joinRequestAccepted,
    TResult? Function()? joinRequestRejected,
    TResult? Function()? memberKicked,
    TResult? Function()? joinedTeam,
    TResult? Function()? leftTeam,
    TResult? Function()? messagedAllMembers,
    TResult? Function(PageOf<Team> teams)? teamSearchedByName,
    TResult? Function(PageOf<Team> teams)? popularTeams,
    TResult? Function(Failure error)? failure,
  }) {
    return joinRequestAccepted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Team> teams)? teamsByUserId,
    TResult Function(Team team)? teamById,
    TResult Function(List<User> teamMembers)? teamMembers,
    TResult Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult Function()? joinRequestAccepted,
    TResult Function()? joinRequestRejected,
    TResult Function()? memberKicked,
    TResult Function()? joinedTeam,
    TResult Function()? leftTeam,
    TResult Function()? messagedAllMembers,
    TResult Function(PageOf<Team> teams)? teamSearchedByName,
    TResult Function(PageOf<Team> teams)? popularTeams,
    TResult Function(Failure error)? failure,
    required TResult orElse(),
  }) {
    if (joinRequestAccepted != null) {
      return joinRequestAccepted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTeamStats value) initial,
    required TResult Function(_LoadingTeamStats value) loading,
    required TResult Function(_TeamsByUserIdTeamStats value) teamsByUserId,
    required TResult Function(_TeamByIdTeamStats value) teamById,
    required TResult Function(_TeamMembers value) teamMembers,
    required TResult Function(_JoinRequests value) joinRequests,
    required TResult Function(_JoinRequestAccepted value) joinRequestAccepted,
    required TResult Function(_JoinRequestRejected value) joinRequestRejected,
    required TResult Function(_MemberKicked value) memberKicked,
    required TResult Function(_JoinedTeam value) joinedTeam,
    required TResult Function(_LeftTeam value) leftTeam,
    required TResult Function(_MessagedAllMembers value) messagedAllMembers,
    required TResult Function(_TeamSearchedByName value) teamSearchedByName,
    required TResult Function(_PopularTeams value) popularTeams,
    required TResult Function(_ErrorTeamStats value) failure,
  }) {
    return joinRequestAccepted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTeamStats value)? initial,
    TResult? Function(_LoadingTeamStats value)? loading,
    TResult? Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult? Function(_TeamByIdTeamStats value)? teamById,
    TResult? Function(_TeamMembers value)? teamMembers,
    TResult? Function(_JoinRequests value)? joinRequests,
    TResult? Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult? Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult? Function(_MemberKicked value)? memberKicked,
    TResult? Function(_JoinedTeam value)? joinedTeam,
    TResult? Function(_LeftTeam value)? leftTeam,
    TResult? Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult? Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult? Function(_PopularTeams value)? popularTeams,
    TResult? Function(_ErrorTeamStats value)? failure,
  }) {
    return joinRequestAccepted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTeamStats value)? initial,
    TResult Function(_LoadingTeamStats value)? loading,
    TResult Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult Function(_TeamByIdTeamStats value)? teamById,
    TResult Function(_TeamMembers value)? teamMembers,
    TResult Function(_JoinRequests value)? joinRequests,
    TResult Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult Function(_MemberKicked value)? memberKicked,
    TResult Function(_JoinedTeam value)? joinedTeam,
    TResult Function(_LeftTeam value)? leftTeam,
    TResult Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult Function(_PopularTeams value)? popularTeams,
    TResult Function(_ErrorTeamStats value)? failure,
    required TResult orElse(),
  }) {
    if (joinRequestAccepted != null) {
      return joinRequestAccepted(this);
    }
    return orElse();
  }
}

abstract class _JoinRequestAccepted extends TeamState {
  const factory _JoinRequestAccepted() = _$_JoinRequestAccepted;
  const _JoinRequestAccepted._() : super._();
}

/// @nodoc
abstract class _$$_JoinRequestRejectedCopyWith<$Res> {
  factory _$$_JoinRequestRejectedCopyWith(_$_JoinRequestRejected value,
          $Res Function(_$_JoinRequestRejected) then) =
      __$$_JoinRequestRejectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_JoinRequestRejectedCopyWithImpl<$Res>
    extends _$TeamStateCopyWithImpl<$Res, _$_JoinRequestRejected>
    implements _$$_JoinRequestRejectedCopyWith<$Res> {
  __$$_JoinRequestRejectedCopyWithImpl(_$_JoinRequestRejected _value,
      $Res Function(_$_JoinRequestRejected) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_JoinRequestRejected extends _JoinRequestRejected {
  const _$_JoinRequestRejected() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Team> teams) teamsByUserId,
    required TResult Function(Team team) teamById,
    required TResult Function(List<User> teamMembers) teamMembers,
    required TResult Function(List<JoinRequest> joinRequests) joinRequests,
    required TResult Function() joinRequestAccepted,
    required TResult Function() joinRequestRejected,
    required TResult Function() memberKicked,
    required TResult Function() joinedTeam,
    required TResult Function() leftTeam,
    required TResult Function() messagedAllMembers,
    required TResult Function(PageOf<Team> teams) teamSearchedByName,
    required TResult Function(PageOf<Team> teams) popularTeams,
    required TResult Function(Failure error) failure,
  }) {
    return joinRequestRejected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Team> teams)? teamsByUserId,
    TResult? Function(Team team)? teamById,
    TResult? Function(List<User> teamMembers)? teamMembers,
    TResult? Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult? Function()? joinRequestAccepted,
    TResult? Function()? joinRequestRejected,
    TResult? Function()? memberKicked,
    TResult? Function()? joinedTeam,
    TResult? Function()? leftTeam,
    TResult? Function()? messagedAllMembers,
    TResult? Function(PageOf<Team> teams)? teamSearchedByName,
    TResult? Function(PageOf<Team> teams)? popularTeams,
    TResult? Function(Failure error)? failure,
  }) {
    return joinRequestRejected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Team> teams)? teamsByUserId,
    TResult Function(Team team)? teamById,
    TResult Function(List<User> teamMembers)? teamMembers,
    TResult Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult Function()? joinRequestAccepted,
    TResult Function()? joinRequestRejected,
    TResult Function()? memberKicked,
    TResult Function()? joinedTeam,
    TResult Function()? leftTeam,
    TResult Function()? messagedAllMembers,
    TResult Function(PageOf<Team> teams)? teamSearchedByName,
    TResult Function(PageOf<Team> teams)? popularTeams,
    TResult Function(Failure error)? failure,
    required TResult orElse(),
  }) {
    if (joinRequestRejected != null) {
      return joinRequestRejected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTeamStats value) initial,
    required TResult Function(_LoadingTeamStats value) loading,
    required TResult Function(_TeamsByUserIdTeamStats value) teamsByUserId,
    required TResult Function(_TeamByIdTeamStats value) teamById,
    required TResult Function(_TeamMembers value) teamMembers,
    required TResult Function(_JoinRequests value) joinRequests,
    required TResult Function(_JoinRequestAccepted value) joinRequestAccepted,
    required TResult Function(_JoinRequestRejected value) joinRequestRejected,
    required TResult Function(_MemberKicked value) memberKicked,
    required TResult Function(_JoinedTeam value) joinedTeam,
    required TResult Function(_LeftTeam value) leftTeam,
    required TResult Function(_MessagedAllMembers value) messagedAllMembers,
    required TResult Function(_TeamSearchedByName value) teamSearchedByName,
    required TResult Function(_PopularTeams value) popularTeams,
    required TResult Function(_ErrorTeamStats value) failure,
  }) {
    return joinRequestRejected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTeamStats value)? initial,
    TResult? Function(_LoadingTeamStats value)? loading,
    TResult? Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult? Function(_TeamByIdTeamStats value)? teamById,
    TResult? Function(_TeamMembers value)? teamMembers,
    TResult? Function(_JoinRequests value)? joinRequests,
    TResult? Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult? Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult? Function(_MemberKicked value)? memberKicked,
    TResult? Function(_JoinedTeam value)? joinedTeam,
    TResult? Function(_LeftTeam value)? leftTeam,
    TResult? Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult? Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult? Function(_PopularTeams value)? popularTeams,
    TResult? Function(_ErrorTeamStats value)? failure,
  }) {
    return joinRequestRejected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTeamStats value)? initial,
    TResult Function(_LoadingTeamStats value)? loading,
    TResult Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult Function(_TeamByIdTeamStats value)? teamById,
    TResult Function(_TeamMembers value)? teamMembers,
    TResult Function(_JoinRequests value)? joinRequests,
    TResult Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult Function(_MemberKicked value)? memberKicked,
    TResult Function(_JoinedTeam value)? joinedTeam,
    TResult Function(_LeftTeam value)? leftTeam,
    TResult Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult Function(_PopularTeams value)? popularTeams,
    TResult Function(_ErrorTeamStats value)? failure,
    required TResult orElse(),
  }) {
    if (joinRequestRejected != null) {
      return joinRequestRejected(this);
    }
    return orElse();
  }
}

abstract class _JoinRequestRejected extends TeamState {
  const factory _JoinRequestRejected() = _$_JoinRequestRejected;
  const _JoinRequestRejected._() : super._();
}

/// @nodoc
abstract class _$$_MemberKickedCopyWith<$Res> {
  factory _$$_MemberKickedCopyWith(
          _$_MemberKicked value, $Res Function(_$_MemberKicked) then) =
      __$$_MemberKickedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_MemberKickedCopyWithImpl<$Res>
    extends _$TeamStateCopyWithImpl<$Res, _$_MemberKicked>
    implements _$$_MemberKickedCopyWith<$Res> {
  __$$_MemberKickedCopyWithImpl(
      _$_MemberKicked _value, $Res Function(_$_MemberKicked) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_MemberKicked extends _MemberKicked {
  const _$_MemberKicked() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Team> teams) teamsByUserId,
    required TResult Function(Team team) teamById,
    required TResult Function(List<User> teamMembers) teamMembers,
    required TResult Function(List<JoinRequest> joinRequests) joinRequests,
    required TResult Function() joinRequestAccepted,
    required TResult Function() joinRequestRejected,
    required TResult Function() memberKicked,
    required TResult Function() joinedTeam,
    required TResult Function() leftTeam,
    required TResult Function() messagedAllMembers,
    required TResult Function(PageOf<Team> teams) teamSearchedByName,
    required TResult Function(PageOf<Team> teams) popularTeams,
    required TResult Function(Failure error) failure,
  }) {
    return memberKicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Team> teams)? teamsByUserId,
    TResult? Function(Team team)? teamById,
    TResult? Function(List<User> teamMembers)? teamMembers,
    TResult? Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult? Function()? joinRequestAccepted,
    TResult? Function()? joinRequestRejected,
    TResult? Function()? memberKicked,
    TResult? Function()? joinedTeam,
    TResult? Function()? leftTeam,
    TResult? Function()? messagedAllMembers,
    TResult? Function(PageOf<Team> teams)? teamSearchedByName,
    TResult? Function(PageOf<Team> teams)? popularTeams,
    TResult? Function(Failure error)? failure,
  }) {
    return memberKicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Team> teams)? teamsByUserId,
    TResult Function(Team team)? teamById,
    TResult Function(List<User> teamMembers)? teamMembers,
    TResult Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult Function()? joinRequestAccepted,
    TResult Function()? joinRequestRejected,
    TResult Function()? memberKicked,
    TResult Function()? joinedTeam,
    TResult Function()? leftTeam,
    TResult Function()? messagedAllMembers,
    TResult Function(PageOf<Team> teams)? teamSearchedByName,
    TResult Function(PageOf<Team> teams)? popularTeams,
    TResult Function(Failure error)? failure,
    required TResult orElse(),
  }) {
    if (memberKicked != null) {
      return memberKicked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTeamStats value) initial,
    required TResult Function(_LoadingTeamStats value) loading,
    required TResult Function(_TeamsByUserIdTeamStats value) teamsByUserId,
    required TResult Function(_TeamByIdTeamStats value) teamById,
    required TResult Function(_TeamMembers value) teamMembers,
    required TResult Function(_JoinRequests value) joinRequests,
    required TResult Function(_JoinRequestAccepted value) joinRequestAccepted,
    required TResult Function(_JoinRequestRejected value) joinRequestRejected,
    required TResult Function(_MemberKicked value) memberKicked,
    required TResult Function(_JoinedTeam value) joinedTeam,
    required TResult Function(_LeftTeam value) leftTeam,
    required TResult Function(_MessagedAllMembers value) messagedAllMembers,
    required TResult Function(_TeamSearchedByName value) teamSearchedByName,
    required TResult Function(_PopularTeams value) popularTeams,
    required TResult Function(_ErrorTeamStats value) failure,
  }) {
    return memberKicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTeamStats value)? initial,
    TResult? Function(_LoadingTeamStats value)? loading,
    TResult? Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult? Function(_TeamByIdTeamStats value)? teamById,
    TResult? Function(_TeamMembers value)? teamMembers,
    TResult? Function(_JoinRequests value)? joinRequests,
    TResult? Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult? Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult? Function(_MemberKicked value)? memberKicked,
    TResult? Function(_JoinedTeam value)? joinedTeam,
    TResult? Function(_LeftTeam value)? leftTeam,
    TResult? Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult? Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult? Function(_PopularTeams value)? popularTeams,
    TResult? Function(_ErrorTeamStats value)? failure,
  }) {
    return memberKicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTeamStats value)? initial,
    TResult Function(_LoadingTeamStats value)? loading,
    TResult Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult Function(_TeamByIdTeamStats value)? teamById,
    TResult Function(_TeamMembers value)? teamMembers,
    TResult Function(_JoinRequests value)? joinRequests,
    TResult Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult Function(_MemberKicked value)? memberKicked,
    TResult Function(_JoinedTeam value)? joinedTeam,
    TResult Function(_LeftTeam value)? leftTeam,
    TResult Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult Function(_PopularTeams value)? popularTeams,
    TResult Function(_ErrorTeamStats value)? failure,
    required TResult orElse(),
  }) {
    if (memberKicked != null) {
      return memberKicked(this);
    }
    return orElse();
  }
}

abstract class _MemberKicked extends TeamState {
  const factory _MemberKicked() = _$_MemberKicked;
  const _MemberKicked._() : super._();
}

/// @nodoc
abstract class _$$_JoinedTeamCopyWith<$Res> {
  factory _$$_JoinedTeamCopyWith(
          _$_JoinedTeam value, $Res Function(_$_JoinedTeam) then) =
      __$$_JoinedTeamCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_JoinedTeamCopyWithImpl<$Res>
    extends _$TeamStateCopyWithImpl<$Res, _$_JoinedTeam>
    implements _$$_JoinedTeamCopyWith<$Res> {
  __$$_JoinedTeamCopyWithImpl(
      _$_JoinedTeam _value, $Res Function(_$_JoinedTeam) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_JoinedTeam extends _JoinedTeam {
  const _$_JoinedTeam() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Team> teams) teamsByUserId,
    required TResult Function(Team team) teamById,
    required TResult Function(List<User> teamMembers) teamMembers,
    required TResult Function(List<JoinRequest> joinRequests) joinRequests,
    required TResult Function() joinRequestAccepted,
    required TResult Function() joinRequestRejected,
    required TResult Function() memberKicked,
    required TResult Function() joinedTeam,
    required TResult Function() leftTeam,
    required TResult Function() messagedAllMembers,
    required TResult Function(PageOf<Team> teams) teamSearchedByName,
    required TResult Function(PageOf<Team> teams) popularTeams,
    required TResult Function(Failure error) failure,
  }) {
    return joinedTeam();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Team> teams)? teamsByUserId,
    TResult? Function(Team team)? teamById,
    TResult? Function(List<User> teamMembers)? teamMembers,
    TResult? Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult? Function()? joinRequestAccepted,
    TResult? Function()? joinRequestRejected,
    TResult? Function()? memberKicked,
    TResult? Function()? joinedTeam,
    TResult? Function()? leftTeam,
    TResult? Function()? messagedAllMembers,
    TResult? Function(PageOf<Team> teams)? teamSearchedByName,
    TResult? Function(PageOf<Team> teams)? popularTeams,
    TResult? Function(Failure error)? failure,
  }) {
    return joinedTeam?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Team> teams)? teamsByUserId,
    TResult Function(Team team)? teamById,
    TResult Function(List<User> teamMembers)? teamMembers,
    TResult Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult Function()? joinRequestAccepted,
    TResult Function()? joinRequestRejected,
    TResult Function()? memberKicked,
    TResult Function()? joinedTeam,
    TResult Function()? leftTeam,
    TResult Function()? messagedAllMembers,
    TResult Function(PageOf<Team> teams)? teamSearchedByName,
    TResult Function(PageOf<Team> teams)? popularTeams,
    TResult Function(Failure error)? failure,
    required TResult orElse(),
  }) {
    if (joinedTeam != null) {
      return joinedTeam();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTeamStats value) initial,
    required TResult Function(_LoadingTeamStats value) loading,
    required TResult Function(_TeamsByUserIdTeamStats value) teamsByUserId,
    required TResult Function(_TeamByIdTeamStats value) teamById,
    required TResult Function(_TeamMembers value) teamMembers,
    required TResult Function(_JoinRequests value) joinRequests,
    required TResult Function(_JoinRequestAccepted value) joinRequestAccepted,
    required TResult Function(_JoinRequestRejected value) joinRequestRejected,
    required TResult Function(_MemberKicked value) memberKicked,
    required TResult Function(_JoinedTeam value) joinedTeam,
    required TResult Function(_LeftTeam value) leftTeam,
    required TResult Function(_MessagedAllMembers value) messagedAllMembers,
    required TResult Function(_TeamSearchedByName value) teamSearchedByName,
    required TResult Function(_PopularTeams value) popularTeams,
    required TResult Function(_ErrorTeamStats value) failure,
  }) {
    return joinedTeam(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTeamStats value)? initial,
    TResult? Function(_LoadingTeamStats value)? loading,
    TResult? Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult? Function(_TeamByIdTeamStats value)? teamById,
    TResult? Function(_TeamMembers value)? teamMembers,
    TResult? Function(_JoinRequests value)? joinRequests,
    TResult? Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult? Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult? Function(_MemberKicked value)? memberKicked,
    TResult? Function(_JoinedTeam value)? joinedTeam,
    TResult? Function(_LeftTeam value)? leftTeam,
    TResult? Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult? Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult? Function(_PopularTeams value)? popularTeams,
    TResult? Function(_ErrorTeamStats value)? failure,
  }) {
    return joinedTeam?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTeamStats value)? initial,
    TResult Function(_LoadingTeamStats value)? loading,
    TResult Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult Function(_TeamByIdTeamStats value)? teamById,
    TResult Function(_TeamMembers value)? teamMembers,
    TResult Function(_JoinRequests value)? joinRequests,
    TResult Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult Function(_MemberKicked value)? memberKicked,
    TResult Function(_JoinedTeam value)? joinedTeam,
    TResult Function(_LeftTeam value)? leftTeam,
    TResult Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult Function(_PopularTeams value)? popularTeams,
    TResult Function(_ErrorTeamStats value)? failure,
    required TResult orElse(),
  }) {
    if (joinedTeam != null) {
      return joinedTeam(this);
    }
    return orElse();
  }
}

abstract class _JoinedTeam extends TeamState {
  const factory _JoinedTeam() = _$_JoinedTeam;
  const _JoinedTeam._() : super._();
}

/// @nodoc
abstract class _$$_LeftTeamCopyWith<$Res> {
  factory _$$_LeftTeamCopyWith(
          _$_LeftTeam value, $Res Function(_$_LeftTeam) then) =
      __$$_LeftTeamCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LeftTeamCopyWithImpl<$Res>
    extends _$TeamStateCopyWithImpl<$Res, _$_LeftTeam>
    implements _$$_LeftTeamCopyWith<$Res> {
  __$$_LeftTeamCopyWithImpl(
      _$_LeftTeam _value, $Res Function(_$_LeftTeam) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LeftTeam extends _LeftTeam {
  const _$_LeftTeam() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Team> teams) teamsByUserId,
    required TResult Function(Team team) teamById,
    required TResult Function(List<User> teamMembers) teamMembers,
    required TResult Function(List<JoinRequest> joinRequests) joinRequests,
    required TResult Function() joinRequestAccepted,
    required TResult Function() joinRequestRejected,
    required TResult Function() memberKicked,
    required TResult Function() joinedTeam,
    required TResult Function() leftTeam,
    required TResult Function() messagedAllMembers,
    required TResult Function(PageOf<Team> teams) teamSearchedByName,
    required TResult Function(PageOf<Team> teams) popularTeams,
    required TResult Function(Failure error) failure,
  }) {
    return leftTeam();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Team> teams)? teamsByUserId,
    TResult? Function(Team team)? teamById,
    TResult? Function(List<User> teamMembers)? teamMembers,
    TResult? Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult? Function()? joinRequestAccepted,
    TResult? Function()? joinRequestRejected,
    TResult? Function()? memberKicked,
    TResult? Function()? joinedTeam,
    TResult? Function()? leftTeam,
    TResult? Function()? messagedAllMembers,
    TResult? Function(PageOf<Team> teams)? teamSearchedByName,
    TResult? Function(PageOf<Team> teams)? popularTeams,
    TResult? Function(Failure error)? failure,
  }) {
    return leftTeam?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Team> teams)? teamsByUserId,
    TResult Function(Team team)? teamById,
    TResult Function(List<User> teamMembers)? teamMembers,
    TResult Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult Function()? joinRequestAccepted,
    TResult Function()? joinRequestRejected,
    TResult Function()? memberKicked,
    TResult Function()? joinedTeam,
    TResult Function()? leftTeam,
    TResult Function()? messagedAllMembers,
    TResult Function(PageOf<Team> teams)? teamSearchedByName,
    TResult Function(PageOf<Team> teams)? popularTeams,
    TResult Function(Failure error)? failure,
    required TResult orElse(),
  }) {
    if (leftTeam != null) {
      return leftTeam();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTeamStats value) initial,
    required TResult Function(_LoadingTeamStats value) loading,
    required TResult Function(_TeamsByUserIdTeamStats value) teamsByUserId,
    required TResult Function(_TeamByIdTeamStats value) teamById,
    required TResult Function(_TeamMembers value) teamMembers,
    required TResult Function(_JoinRequests value) joinRequests,
    required TResult Function(_JoinRequestAccepted value) joinRequestAccepted,
    required TResult Function(_JoinRequestRejected value) joinRequestRejected,
    required TResult Function(_MemberKicked value) memberKicked,
    required TResult Function(_JoinedTeam value) joinedTeam,
    required TResult Function(_LeftTeam value) leftTeam,
    required TResult Function(_MessagedAllMembers value) messagedAllMembers,
    required TResult Function(_TeamSearchedByName value) teamSearchedByName,
    required TResult Function(_PopularTeams value) popularTeams,
    required TResult Function(_ErrorTeamStats value) failure,
  }) {
    return leftTeam(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTeamStats value)? initial,
    TResult? Function(_LoadingTeamStats value)? loading,
    TResult? Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult? Function(_TeamByIdTeamStats value)? teamById,
    TResult? Function(_TeamMembers value)? teamMembers,
    TResult? Function(_JoinRequests value)? joinRequests,
    TResult? Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult? Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult? Function(_MemberKicked value)? memberKicked,
    TResult? Function(_JoinedTeam value)? joinedTeam,
    TResult? Function(_LeftTeam value)? leftTeam,
    TResult? Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult? Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult? Function(_PopularTeams value)? popularTeams,
    TResult? Function(_ErrorTeamStats value)? failure,
  }) {
    return leftTeam?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTeamStats value)? initial,
    TResult Function(_LoadingTeamStats value)? loading,
    TResult Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult Function(_TeamByIdTeamStats value)? teamById,
    TResult Function(_TeamMembers value)? teamMembers,
    TResult Function(_JoinRequests value)? joinRequests,
    TResult Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult Function(_MemberKicked value)? memberKicked,
    TResult Function(_JoinedTeam value)? joinedTeam,
    TResult Function(_LeftTeam value)? leftTeam,
    TResult Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult Function(_PopularTeams value)? popularTeams,
    TResult Function(_ErrorTeamStats value)? failure,
    required TResult orElse(),
  }) {
    if (leftTeam != null) {
      return leftTeam(this);
    }
    return orElse();
  }
}

abstract class _LeftTeam extends TeamState {
  const factory _LeftTeam() = _$_LeftTeam;
  const _LeftTeam._() : super._();
}

/// @nodoc
abstract class _$$_MessagedAllMembersCopyWith<$Res> {
  factory _$$_MessagedAllMembersCopyWith(_$_MessagedAllMembers value,
          $Res Function(_$_MessagedAllMembers) then) =
      __$$_MessagedAllMembersCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_MessagedAllMembersCopyWithImpl<$Res>
    extends _$TeamStateCopyWithImpl<$Res, _$_MessagedAllMembers>
    implements _$$_MessagedAllMembersCopyWith<$Res> {
  __$$_MessagedAllMembersCopyWithImpl(
      _$_MessagedAllMembers _value, $Res Function(_$_MessagedAllMembers) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_MessagedAllMembers extends _MessagedAllMembers {
  const _$_MessagedAllMembers() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Team> teams) teamsByUserId,
    required TResult Function(Team team) teamById,
    required TResult Function(List<User> teamMembers) teamMembers,
    required TResult Function(List<JoinRequest> joinRequests) joinRequests,
    required TResult Function() joinRequestAccepted,
    required TResult Function() joinRequestRejected,
    required TResult Function() memberKicked,
    required TResult Function() joinedTeam,
    required TResult Function() leftTeam,
    required TResult Function() messagedAllMembers,
    required TResult Function(PageOf<Team> teams) teamSearchedByName,
    required TResult Function(PageOf<Team> teams) popularTeams,
    required TResult Function(Failure error) failure,
  }) {
    return messagedAllMembers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Team> teams)? teamsByUserId,
    TResult? Function(Team team)? teamById,
    TResult? Function(List<User> teamMembers)? teamMembers,
    TResult? Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult? Function()? joinRequestAccepted,
    TResult? Function()? joinRequestRejected,
    TResult? Function()? memberKicked,
    TResult? Function()? joinedTeam,
    TResult? Function()? leftTeam,
    TResult? Function()? messagedAllMembers,
    TResult? Function(PageOf<Team> teams)? teamSearchedByName,
    TResult? Function(PageOf<Team> teams)? popularTeams,
    TResult? Function(Failure error)? failure,
  }) {
    return messagedAllMembers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Team> teams)? teamsByUserId,
    TResult Function(Team team)? teamById,
    TResult Function(List<User> teamMembers)? teamMembers,
    TResult Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult Function()? joinRequestAccepted,
    TResult Function()? joinRequestRejected,
    TResult Function()? memberKicked,
    TResult Function()? joinedTeam,
    TResult Function()? leftTeam,
    TResult Function()? messagedAllMembers,
    TResult Function(PageOf<Team> teams)? teamSearchedByName,
    TResult Function(PageOf<Team> teams)? popularTeams,
    TResult Function(Failure error)? failure,
    required TResult orElse(),
  }) {
    if (messagedAllMembers != null) {
      return messagedAllMembers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTeamStats value) initial,
    required TResult Function(_LoadingTeamStats value) loading,
    required TResult Function(_TeamsByUserIdTeamStats value) teamsByUserId,
    required TResult Function(_TeamByIdTeamStats value) teamById,
    required TResult Function(_TeamMembers value) teamMembers,
    required TResult Function(_JoinRequests value) joinRequests,
    required TResult Function(_JoinRequestAccepted value) joinRequestAccepted,
    required TResult Function(_JoinRequestRejected value) joinRequestRejected,
    required TResult Function(_MemberKicked value) memberKicked,
    required TResult Function(_JoinedTeam value) joinedTeam,
    required TResult Function(_LeftTeam value) leftTeam,
    required TResult Function(_MessagedAllMembers value) messagedAllMembers,
    required TResult Function(_TeamSearchedByName value) teamSearchedByName,
    required TResult Function(_PopularTeams value) popularTeams,
    required TResult Function(_ErrorTeamStats value) failure,
  }) {
    return messagedAllMembers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTeamStats value)? initial,
    TResult? Function(_LoadingTeamStats value)? loading,
    TResult? Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult? Function(_TeamByIdTeamStats value)? teamById,
    TResult? Function(_TeamMembers value)? teamMembers,
    TResult? Function(_JoinRequests value)? joinRequests,
    TResult? Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult? Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult? Function(_MemberKicked value)? memberKicked,
    TResult? Function(_JoinedTeam value)? joinedTeam,
    TResult? Function(_LeftTeam value)? leftTeam,
    TResult? Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult? Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult? Function(_PopularTeams value)? popularTeams,
    TResult? Function(_ErrorTeamStats value)? failure,
  }) {
    return messagedAllMembers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTeamStats value)? initial,
    TResult Function(_LoadingTeamStats value)? loading,
    TResult Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult Function(_TeamByIdTeamStats value)? teamById,
    TResult Function(_TeamMembers value)? teamMembers,
    TResult Function(_JoinRequests value)? joinRequests,
    TResult Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult Function(_MemberKicked value)? memberKicked,
    TResult Function(_JoinedTeam value)? joinedTeam,
    TResult Function(_LeftTeam value)? leftTeam,
    TResult Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult Function(_PopularTeams value)? popularTeams,
    TResult Function(_ErrorTeamStats value)? failure,
    required TResult orElse(),
  }) {
    if (messagedAllMembers != null) {
      return messagedAllMembers(this);
    }
    return orElse();
  }
}

abstract class _MessagedAllMembers extends TeamState {
  const factory _MessagedAllMembers() = _$_MessagedAllMembers;
  const _MessagedAllMembers._() : super._();
}

/// @nodoc
abstract class _$$_TeamSearchedByNameCopyWith<$Res> {
  factory _$$_TeamSearchedByNameCopyWith(_$_TeamSearchedByName value,
          $Res Function(_$_TeamSearchedByName) then) =
      __$$_TeamSearchedByNameCopyWithImpl<$Res>;
  @useResult
  $Res call({PageOf<Team> teams});

  $PageOfCopyWith<Team, $Res> get teams;
}

/// @nodoc
class __$$_TeamSearchedByNameCopyWithImpl<$Res>
    extends _$TeamStateCopyWithImpl<$Res, _$_TeamSearchedByName>
    implements _$$_TeamSearchedByNameCopyWith<$Res> {
  __$$_TeamSearchedByNameCopyWithImpl(
      _$_TeamSearchedByName _value, $Res Function(_$_TeamSearchedByName) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teams = null,
  }) {
    return _then(_$_TeamSearchedByName(
      null == teams
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as PageOf<Team>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PageOfCopyWith<Team, $Res> get teams {
    return $PageOfCopyWith<Team, $Res>(_value.teams, (value) {
      return _then(_value.copyWith(teams: value));
    });
  }
}

/// @nodoc

class _$_TeamSearchedByName extends _TeamSearchedByName {
  const _$_TeamSearchedByName(this.teams) : super._();

  @override
  final PageOf<Team> teams;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TeamSearchedByNameCopyWith<_$_TeamSearchedByName> get copyWith =>
      __$$_TeamSearchedByNameCopyWithImpl<_$_TeamSearchedByName>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Team> teams) teamsByUserId,
    required TResult Function(Team team) teamById,
    required TResult Function(List<User> teamMembers) teamMembers,
    required TResult Function(List<JoinRequest> joinRequests) joinRequests,
    required TResult Function() joinRequestAccepted,
    required TResult Function() joinRequestRejected,
    required TResult Function() memberKicked,
    required TResult Function() joinedTeam,
    required TResult Function() leftTeam,
    required TResult Function() messagedAllMembers,
    required TResult Function(PageOf<Team> teams) teamSearchedByName,
    required TResult Function(PageOf<Team> teams) popularTeams,
    required TResult Function(Failure error) failure,
  }) {
    return teamSearchedByName(teams);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Team> teams)? teamsByUserId,
    TResult? Function(Team team)? teamById,
    TResult? Function(List<User> teamMembers)? teamMembers,
    TResult? Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult? Function()? joinRequestAccepted,
    TResult? Function()? joinRequestRejected,
    TResult? Function()? memberKicked,
    TResult? Function()? joinedTeam,
    TResult? Function()? leftTeam,
    TResult? Function()? messagedAllMembers,
    TResult? Function(PageOf<Team> teams)? teamSearchedByName,
    TResult? Function(PageOf<Team> teams)? popularTeams,
    TResult? Function(Failure error)? failure,
  }) {
    return teamSearchedByName?.call(teams);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Team> teams)? teamsByUserId,
    TResult Function(Team team)? teamById,
    TResult Function(List<User> teamMembers)? teamMembers,
    TResult Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult Function()? joinRequestAccepted,
    TResult Function()? joinRequestRejected,
    TResult Function()? memberKicked,
    TResult Function()? joinedTeam,
    TResult Function()? leftTeam,
    TResult Function()? messagedAllMembers,
    TResult Function(PageOf<Team> teams)? teamSearchedByName,
    TResult Function(PageOf<Team> teams)? popularTeams,
    TResult Function(Failure error)? failure,
    required TResult orElse(),
  }) {
    if (teamSearchedByName != null) {
      return teamSearchedByName(teams);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTeamStats value) initial,
    required TResult Function(_LoadingTeamStats value) loading,
    required TResult Function(_TeamsByUserIdTeamStats value) teamsByUserId,
    required TResult Function(_TeamByIdTeamStats value) teamById,
    required TResult Function(_TeamMembers value) teamMembers,
    required TResult Function(_JoinRequests value) joinRequests,
    required TResult Function(_JoinRequestAccepted value) joinRequestAccepted,
    required TResult Function(_JoinRequestRejected value) joinRequestRejected,
    required TResult Function(_MemberKicked value) memberKicked,
    required TResult Function(_JoinedTeam value) joinedTeam,
    required TResult Function(_LeftTeam value) leftTeam,
    required TResult Function(_MessagedAllMembers value) messagedAllMembers,
    required TResult Function(_TeamSearchedByName value) teamSearchedByName,
    required TResult Function(_PopularTeams value) popularTeams,
    required TResult Function(_ErrorTeamStats value) failure,
  }) {
    return teamSearchedByName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTeamStats value)? initial,
    TResult? Function(_LoadingTeamStats value)? loading,
    TResult? Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult? Function(_TeamByIdTeamStats value)? teamById,
    TResult? Function(_TeamMembers value)? teamMembers,
    TResult? Function(_JoinRequests value)? joinRequests,
    TResult? Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult? Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult? Function(_MemberKicked value)? memberKicked,
    TResult? Function(_JoinedTeam value)? joinedTeam,
    TResult? Function(_LeftTeam value)? leftTeam,
    TResult? Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult? Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult? Function(_PopularTeams value)? popularTeams,
    TResult? Function(_ErrorTeamStats value)? failure,
  }) {
    return teamSearchedByName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTeamStats value)? initial,
    TResult Function(_LoadingTeamStats value)? loading,
    TResult Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult Function(_TeamByIdTeamStats value)? teamById,
    TResult Function(_TeamMembers value)? teamMembers,
    TResult Function(_JoinRequests value)? joinRequests,
    TResult Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult Function(_MemberKicked value)? memberKicked,
    TResult Function(_JoinedTeam value)? joinedTeam,
    TResult Function(_LeftTeam value)? leftTeam,
    TResult Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult Function(_PopularTeams value)? popularTeams,
    TResult Function(_ErrorTeamStats value)? failure,
    required TResult orElse(),
  }) {
    if (teamSearchedByName != null) {
      return teamSearchedByName(this);
    }
    return orElse();
  }
}

abstract class _TeamSearchedByName extends TeamState {
  const factory _TeamSearchedByName(final PageOf<Team> teams) =
      _$_TeamSearchedByName;
  const _TeamSearchedByName._() : super._();

  PageOf<Team> get teams;
  @JsonKey(ignore: true)
  _$$_TeamSearchedByNameCopyWith<_$_TeamSearchedByName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PopularTeamsCopyWith<$Res> {
  factory _$$_PopularTeamsCopyWith(
          _$_PopularTeams value, $Res Function(_$_PopularTeams) then) =
      __$$_PopularTeamsCopyWithImpl<$Res>;
  @useResult
  $Res call({PageOf<Team> teams});

  $PageOfCopyWith<Team, $Res> get teams;
}

/// @nodoc
class __$$_PopularTeamsCopyWithImpl<$Res>
    extends _$TeamStateCopyWithImpl<$Res, _$_PopularTeams>
    implements _$$_PopularTeamsCopyWith<$Res> {
  __$$_PopularTeamsCopyWithImpl(
      _$_PopularTeams _value, $Res Function(_$_PopularTeams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teams = null,
  }) {
    return _then(_$_PopularTeams(
      null == teams
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as PageOf<Team>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PageOfCopyWith<Team, $Res> get teams {
    return $PageOfCopyWith<Team, $Res>(_value.teams, (value) {
      return _then(_value.copyWith(teams: value));
    });
  }
}

/// @nodoc

class _$_PopularTeams extends _PopularTeams {
  const _$_PopularTeams(this.teams) : super._();

  @override
  final PageOf<Team> teams;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PopularTeamsCopyWith<_$_PopularTeams> get copyWith =>
      __$$_PopularTeamsCopyWithImpl<_$_PopularTeams>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Team> teams) teamsByUserId,
    required TResult Function(Team team) teamById,
    required TResult Function(List<User> teamMembers) teamMembers,
    required TResult Function(List<JoinRequest> joinRequests) joinRequests,
    required TResult Function() joinRequestAccepted,
    required TResult Function() joinRequestRejected,
    required TResult Function() memberKicked,
    required TResult Function() joinedTeam,
    required TResult Function() leftTeam,
    required TResult Function() messagedAllMembers,
    required TResult Function(PageOf<Team> teams) teamSearchedByName,
    required TResult Function(PageOf<Team> teams) popularTeams,
    required TResult Function(Failure error) failure,
  }) {
    return popularTeams(teams);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Team> teams)? teamsByUserId,
    TResult? Function(Team team)? teamById,
    TResult? Function(List<User> teamMembers)? teamMembers,
    TResult? Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult? Function()? joinRequestAccepted,
    TResult? Function()? joinRequestRejected,
    TResult? Function()? memberKicked,
    TResult? Function()? joinedTeam,
    TResult? Function()? leftTeam,
    TResult? Function()? messagedAllMembers,
    TResult? Function(PageOf<Team> teams)? teamSearchedByName,
    TResult? Function(PageOf<Team> teams)? popularTeams,
    TResult? Function(Failure error)? failure,
  }) {
    return popularTeams?.call(teams);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Team> teams)? teamsByUserId,
    TResult Function(Team team)? teamById,
    TResult Function(List<User> teamMembers)? teamMembers,
    TResult Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult Function()? joinRequestAccepted,
    TResult Function()? joinRequestRejected,
    TResult Function()? memberKicked,
    TResult Function()? joinedTeam,
    TResult Function()? leftTeam,
    TResult Function()? messagedAllMembers,
    TResult Function(PageOf<Team> teams)? teamSearchedByName,
    TResult Function(PageOf<Team> teams)? popularTeams,
    TResult Function(Failure error)? failure,
    required TResult orElse(),
  }) {
    if (popularTeams != null) {
      return popularTeams(teams);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTeamStats value) initial,
    required TResult Function(_LoadingTeamStats value) loading,
    required TResult Function(_TeamsByUserIdTeamStats value) teamsByUserId,
    required TResult Function(_TeamByIdTeamStats value) teamById,
    required TResult Function(_TeamMembers value) teamMembers,
    required TResult Function(_JoinRequests value) joinRequests,
    required TResult Function(_JoinRequestAccepted value) joinRequestAccepted,
    required TResult Function(_JoinRequestRejected value) joinRequestRejected,
    required TResult Function(_MemberKicked value) memberKicked,
    required TResult Function(_JoinedTeam value) joinedTeam,
    required TResult Function(_LeftTeam value) leftTeam,
    required TResult Function(_MessagedAllMembers value) messagedAllMembers,
    required TResult Function(_TeamSearchedByName value) teamSearchedByName,
    required TResult Function(_PopularTeams value) popularTeams,
    required TResult Function(_ErrorTeamStats value) failure,
  }) {
    return popularTeams(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTeamStats value)? initial,
    TResult? Function(_LoadingTeamStats value)? loading,
    TResult? Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult? Function(_TeamByIdTeamStats value)? teamById,
    TResult? Function(_TeamMembers value)? teamMembers,
    TResult? Function(_JoinRequests value)? joinRequests,
    TResult? Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult? Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult? Function(_MemberKicked value)? memberKicked,
    TResult? Function(_JoinedTeam value)? joinedTeam,
    TResult? Function(_LeftTeam value)? leftTeam,
    TResult? Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult? Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult? Function(_PopularTeams value)? popularTeams,
    TResult? Function(_ErrorTeamStats value)? failure,
  }) {
    return popularTeams?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTeamStats value)? initial,
    TResult Function(_LoadingTeamStats value)? loading,
    TResult Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult Function(_TeamByIdTeamStats value)? teamById,
    TResult Function(_TeamMembers value)? teamMembers,
    TResult Function(_JoinRequests value)? joinRequests,
    TResult Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult Function(_MemberKicked value)? memberKicked,
    TResult Function(_JoinedTeam value)? joinedTeam,
    TResult Function(_LeftTeam value)? leftTeam,
    TResult Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult Function(_PopularTeams value)? popularTeams,
    TResult Function(_ErrorTeamStats value)? failure,
    required TResult orElse(),
  }) {
    if (popularTeams != null) {
      return popularTeams(this);
    }
    return orElse();
  }
}

abstract class _PopularTeams extends TeamState {
  const factory _PopularTeams(final PageOf<Team> teams) = _$_PopularTeams;
  const _PopularTeams._() : super._();

  PageOf<Team> get teams;
  @JsonKey(ignore: true)
  _$$_PopularTeamsCopyWith<_$_PopularTeams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorTeamStatsCopyWith<$Res> {
  factory _$$_ErrorTeamStatsCopyWith(
          _$_ErrorTeamStats value, $Res Function(_$_ErrorTeamStats) then) =
      __$$_ErrorTeamStatsCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure error});
}

/// @nodoc
class __$$_ErrorTeamStatsCopyWithImpl<$Res>
    extends _$TeamStateCopyWithImpl<$Res, _$_ErrorTeamStats>
    implements _$$_ErrorTeamStatsCopyWith<$Res> {
  __$$_ErrorTeamStatsCopyWithImpl(
      _$_ErrorTeamStats _value, $Res Function(_$_ErrorTeamStats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_ErrorTeamStats(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_ErrorTeamStats extends _ErrorTeamStats {
  const _$_ErrorTeamStats(this.error) : super._();

  @override
  final Failure error;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorTeamStatsCopyWith<_$_ErrorTeamStats> get copyWith =>
      __$$_ErrorTeamStatsCopyWithImpl<_$_ErrorTeamStats>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Team> teams) teamsByUserId,
    required TResult Function(Team team) teamById,
    required TResult Function(List<User> teamMembers) teamMembers,
    required TResult Function(List<JoinRequest> joinRequests) joinRequests,
    required TResult Function() joinRequestAccepted,
    required TResult Function() joinRequestRejected,
    required TResult Function() memberKicked,
    required TResult Function() joinedTeam,
    required TResult Function() leftTeam,
    required TResult Function() messagedAllMembers,
    required TResult Function(PageOf<Team> teams) teamSearchedByName,
    required TResult Function(PageOf<Team> teams) popularTeams,
    required TResult Function(Failure error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Team> teams)? teamsByUserId,
    TResult? Function(Team team)? teamById,
    TResult? Function(List<User> teamMembers)? teamMembers,
    TResult? Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult? Function()? joinRequestAccepted,
    TResult? Function()? joinRequestRejected,
    TResult? Function()? memberKicked,
    TResult? Function()? joinedTeam,
    TResult? Function()? leftTeam,
    TResult? Function()? messagedAllMembers,
    TResult? Function(PageOf<Team> teams)? teamSearchedByName,
    TResult? Function(PageOf<Team> teams)? popularTeams,
    TResult? Function(Failure error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Team> teams)? teamsByUserId,
    TResult Function(Team team)? teamById,
    TResult Function(List<User> teamMembers)? teamMembers,
    TResult Function(List<JoinRequest> joinRequests)? joinRequests,
    TResult Function()? joinRequestAccepted,
    TResult Function()? joinRequestRejected,
    TResult Function()? memberKicked,
    TResult Function()? joinedTeam,
    TResult Function()? leftTeam,
    TResult Function()? messagedAllMembers,
    TResult Function(PageOf<Team> teams)? teamSearchedByName,
    TResult Function(PageOf<Team> teams)? popularTeams,
    TResult Function(Failure error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialTeamStats value) initial,
    required TResult Function(_LoadingTeamStats value) loading,
    required TResult Function(_TeamsByUserIdTeamStats value) teamsByUserId,
    required TResult Function(_TeamByIdTeamStats value) teamById,
    required TResult Function(_TeamMembers value) teamMembers,
    required TResult Function(_JoinRequests value) joinRequests,
    required TResult Function(_JoinRequestAccepted value) joinRequestAccepted,
    required TResult Function(_JoinRequestRejected value) joinRequestRejected,
    required TResult Function(_MemberKicked value) memberKicked,
    required TResult Function(_JoinedTeam value) joinedTeam,
    required TResult Function(_LeftTeam value) leftTeam,
    required TResult Function(_MessagedAllMembers value) messagedAllMembers,
    required TResult Function(_TeamSearchedByName value) teamSearchedByName,
    required TResult Function(_PopularTeams value) popularTeams,
    required TResult Function(_ErrorTeamStats value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialTeamStats value)? initial,
    TResult? Function(_LoadingTeamStats value)? loading,
    TResult? Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult? Function(_TeamByIdTeamStats value)? teamById,
    TResult? Function(_TeamMembers value)? teamMembers,
    TResult? Function(_JoinRequests value)? joinRequests,
    TResult? Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult? Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult? Function(_MemberKicked value)? memberKicked,
    TResult? Function(_JoinedTeam value)? joinedTeam,
    TResult? Function(_LeftTeam value)? leftTeam,
    TResult? Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult? Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult? Function(_PopularTeams value)? popularTeams,
    TResult? Function(_ErrorTeamStats value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialTeamStats value)? initial,
    TResult Function(_LoadingTeamStats value)? loading,
    TResult Function(_TeamsByUserIdTeamStats value)? teamsByUserId,
    TResult Function(_TeamByIdTeamStats value)? teamById,
    TResult Function(_TeamMembers value)? teamMembers,
    TResult Function(_JoinRequests value)? joinRequests,
    TResult Function(_JoinRequestAccepted value)? joinRequestAccepted,
    TResult Function(_JoinRequestRejected value)? joinRequestRejected,
    TResult Function(_MemberKicked value)? memberKicked,
    TResult Function(_JoinedTeam value)? joinedTeam,
    TResult Function(_LeftTeam value)? leftTeam,
    TResult Function(_MessagedAllMembers value)? messagedAllMembers,
    TResult Function(_TeamSearchedByName value)? teamSearchedByName,
    TResult Function(_PopularTeams value)? popularTeams,
    TResult Function(_ErrorTeamStats value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _ErrorTeamStats extends TeamState {
  const factory _ErrorTeamStats(final Failure error) = _$_ErrorTeamStats;
  const _ErrorTeamStats._() : super._();

  Failure get error;
  @JsonKey(ignore: true)
  _$$_ErrorTeamStatsCopyWith<_$_ErrorTeamStats> get copyWith =>
      throw _privateConstructorUsedError;
}
