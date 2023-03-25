// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teams_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TeamEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getTeamsByUserIdEvent,
    required TResult Function(String teamId) getTeamById,
    required TResult Function(String teamId, int maxMembers) getTeamMembers,
    required TResult Function(String teamId) getTeamJoinRequests,
    required TResult Function(String teamId, String userId) acceptJoinRequest,
    required TResult Function(String teamId, String userId) declineJoinRequest,
    required TResult Function(String teamId, String userId) kickMemberFromTeam,
    required TResult Function(String teamId, String? message, String? password)
        joinTeam,
    required TResult Function(String teamId) leaveTeam,
    required TResult Function(String teamId, String message) messageAllMembers,
    required TResult Function(String teamName, int page) searchTeamByName,
    required TResult Function(int page) getPopularTeams,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getTeamsByUserIdEvent,
    TResult? Function(String teamId)? getTeamById,
    TResult? Function(String teamId, int maxMembers)? getTeamMembers,
    TResult? Function(String teamId)? getTeamJoinRequests,
    TResult? Function(String teamId, String userId)? acceptJoinRequest,
    TResult? Function(String teamId, String userId)? declineJoinRequest,
    TResult? Function(String teamId, String userId)? kickMemberFromTeam,
    TResult? Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult? Function(String teamId)? leaveTeam,
    TResult? Function(String teamId, String message)? messageAllMembers,
    TResult? Function(String teamName, int page)? searchTeamByName,
    TResult? Function(int page)? getPopularTeams,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getTeamsByUserIdEvent,
    TResult Function(String teamId)? getTeamById,
    TResult Function(String teamId, int maxMembers)? getTeamMembers,
    TResult Function(String teamId)? getTeamJoinRequests,
    TResult Function(String teamId, String userId)? acceptJoinRequest,
    TResult Function(String teamId, String userId)? declineJoinRequest,
    TResult Function(String teamId, String userId)? kickMemberFromTeam,
    TResult Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult Function(String teamId)? leaveTeam,
    TResult Function(String teamId, String message)? messageAllMembers,
    TResult Function(String teamName, int page)? searchTeamByName,
    TResult Function(int page)? getPopularTeams,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTeamsByUserIdEvent value)
        getTeamsByUserIdEvent,
    required TResult Function(GetTeamByIdEvent value) getTeamById,
    required TResult Function(GetTeamMembersEvent value) getTeamMembers,
    required TResult Function(GetTeamJoinRequestsEvent value)
        getTeamJoinRequests,
    required TResult Function(AcceptJoinRequestEvent value) acceptJoinRequest,
    required TResult Function(DeclineJoinRequestEvent value) declineJoinRequest,
    required TResult Function(KickMemberFromTeamEvent value) kickMemberFromTeam,
    required TResult Function(JoinTeamEvent value) joinTeam,
    required TResult Function(LeaveTeamEvent value) leaveTeam,
    required TResult Function(MessageAllMembersEvent value) messageAllMembers,
    required TResult Function(SearchTeamByNameEvent value) searchTeamByName,
    required TResult Function(GetPopularTeamsEvent value) getPopularTeams,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult? Function(GetTeamByIdEvent value)? getTeamById,
    TResult? Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult? Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult? Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult? Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult? Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult? Function(JoinTeamEvent value)? joinTeam,
    TResult? Function(LeaveTeamEvent value)? leaveTeam,
    TResult? Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult? Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult? Function(GetPopularTeamsEvent value)? getPopularTeams,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult Function(GetTeamByIdEvent value)? getTeamById,
    TResult Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult Function(JoinTeamEvent value)? joinTeam,
    TResult Function(LeaveTeamEvent value)? leaveTeam,
    TResult Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult Function(GetPopularTeamsEvent value)? getPopularTeams,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamEventCopyWith<$Res> {
  factory $TeamEventCopyWith(TeamEvent value, $Res Function(TeamEvent) then) =
      _$TeamEventCopyWithImpl<$Res, TeamEvent>;
}

/// @nodoc
class _$TeamEventCopyWithImpl<$Res, $Val extends TeamEvent>
    implements $TeamEventCopyWith<$Res> {
  _$TeamEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetTeamsByUserIdEventCopyWith<$Res> {
  factory _$$GetTeamsByUserIdEventCopyWith(_$GetTeamsByUserIdEvent value,
          $Res Function(_$GetTeamsByUserIdEvent) then) =
      __$$GetTeamsByUserIdEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$GetTeamsByUserIdEventCopyWithImpl<$Res>
    extends _$TeamEventCopyWithImpl<$Res, _$GetTeamsByUserIdEvent>
    implements _$$GetTeamsByUserIdEventCopyWith<$Res> {
  __$$GetTeamsByUserIdEventCopyWithImpl(_$GetTeamsByUserIdEvent _value,
      $Res Function(_$GetTeamsByUserIdEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$GetTeamsByUserIdEvent(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetTeamsByUserIdEvent
    with DiagnosticableTreeMixin
    implements GetTeamsByUserIdEvent {
  const _$GetTeamsByUserIdEvent({required this.userId});

  @override
  final String userId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TeamEvent.getTeamsByUserIdEvent(userId: $userId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TeamEvent.getTeamsByUserIdEvent'))
      ..add(DiagnosticsProperty('userId', userId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTeamsByUserIdEvent &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTeamsByUserIdEventCopyWith<_$GetTeamsByUserIdEvent> get copyWith =>
      __$$GetTeamsByUserIdEventCopyWithImpl<_$GetTeamsByUserIdEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getTeamsByUserIdEvent,
    required TResult Function(String teamId) getTeamById,
    required TResult Function(String teamId, int maxMembers) getTeamMembers,
    required TResult Function(String teamId) getTeamJoinRequests,
    required TResult Function(String teamId, String userId) acceptJoinRequest,
    required TResult Function(String teamId, String userId) declineJoinRequest,
    required TResult Function(String teamId, String userId) kickMemberFromTeam,
    required TResult Function(String teamId, String? message, String? password)
        joinTeam,
    required TResult Function(String teamId) leaveTeam,
    required TResult Function(String teamId, String message) messageAllMembers,
    required TResult Function(String teamName, int page) searchTeamByName,
    required TResult Function(int page) getPopularTeams,
  }) {
    return getTeamsByUserIdEvent(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getTeamsByUserIdEvent,
    TResult? Function(String teamId)? getTeamById,
    TResult? Function(String teamId, int maxMembers)? getTeamMembers,
    TResult? Function(String teamId)? getTeamJoinRequests,
    TResult? Function(String teamId, String userId)? acceptJoinRequest,
    TResult? Function(String teamId, String userId)? declineJoinRequest,
    TResult? Function(String teamId, String userId)? kickMemberFromTeam,
    TResult? Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult? Function(String teamId)? leaveTeam,
    TResult? Function(String teamId, String message)? messageAllMembers,
    TResult? Function(String teamName, int page)? searchTeamByName,
    TResult? Function(int page)? getPopularTeams,
  }) {
    return getTeamsByUserIdEvent?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getTeamsByUserIdEvent,
    TResult Function(String teamId)? getTeamById,
    TResult Function(String teamId, int maxMembers)? getTeamMembers,
    TResult Function(String teamId)? getTeamJoinRequests,
    TResult Function(String teamId, String userId)? acceptJoinRequest,
    TResult Function(String teamId, String userId)? declineJoinRequest,
    TResult Function(String teamId, String userId)? kickMemberFromTeam,
    TResult Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult Function(String teamId)? leaveTeam,
    TResult Function(String teamId, String message)? messageAllMembers,
    TResult Function(String teamName, int page)? searchTeamByName,
    TResult Function(int page)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (getTeamsByUserIdEvent != null) {
      return getTeamsByUserIdEvent(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTeamsByUserIdEvent value)
        getTeamsByUserIdEvent,
    required TResult Function(GetTeamByIdEvent value) getTeamById,
    required TResult Function(GetTeamMembersEvent value) getTeamMembers,
    required TResult Function(GetTeamJoinRequestsEvent value)
        getTeamJoinRequests,
    required TResult Function(AcceptJoinRequestEvent value) acceptJoinRequest,
    required TResult Function(DeclineJoinRequestEvent value) declineJoinRequest,
    required TResult Function(KickMemberFromTeamEvent value) kickMemberFromTeam,
    required TResult Function(JoinTeamEvent value) joinTeam,
    required TResult Function(LeaveTeamEvent value) leaveTeam,
    required TResult Function(MessageAllMembersEvent value) messageAllMembers,
    required TResult Function(SearchTeamByNameEvent value) searchTeamByName,
    required TResult Function(GetPopularTeamsEvent value) getPopularTeams,
  }) {
    return getTeamsByUserIdEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult? Function(GetTeamByIdEvent value)? getTeamById,
    TResult? Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult? Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult? Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult? Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult? Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult? Function(JoinTeamEvent value)? joinTeam,
    TResult? Function(LeaveTeamEvent value)? leaveTeam,
    TResult? Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult? Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult? Function(GetPopularTeamsEvent value)? getPopularTeams,
  }) {
    return getTeamsByUserIdEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult Function(GetTeamByIdEvent value)? getTeamById,
    TResult Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult Function(JoinTeamEvent value)? joinTeam,
    TResult Function(LeaveTeamEvent value)? leaveTeam,
    TResult Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult Function(GetPopularTeamsEvent value)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (getTeamsByUserIdEvent != null) {
      return getTeamsByUserIdEvent(this);
    }
    return orElse();
  }
}

abstract class GetTeamsByUserIdEvent implements TeamEvent {
  const factory GetTeamsByUserIdEvent({required final String userId}) =
      _$GetTeamsByUserIdEvent;

  String get userId;
  @JsonKey(ignore: true)
  _$$GetTeamsByUserIdEventCopyWith<_$GetTeamsByUserIdEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetTeamByIdEventCopyWith<$Res> {
  factory _$$GetTeamByIdEventCopyWith(
          _$GetTeamByIdEvent value, $Res Function(_$GetTeamByIdEvent) then) =
      __$$GetTeamByIdEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String teamId});
}

/// @nodoc
class __$$GetTeamByIdEventCopyWithImpl<$Res>
    extends _$TeamEventCopyWithImpl<$Res, _$GetTeamByIdEvent>
    implements _$$GetTeamByIdEventCopyWith<$Res> {
  __$$GetTeamByIdEventCopyWithImpl(
      _$GetTeamByIdEvent _value, $Res Function(_$GetTeamByIdEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamId = null,
  }) {
    return _then(_$GetTeamByIdEvent(
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetTeamByIdEvent
    with DiagnosticableTreeMixin
    implements GetTeamByIdEvent {
  const _$GetTeamByIdEvent({required this.teamId});

  @override
  final String teamId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TeamEvent.getTeamById(teamId: $teamId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TeamEvent.getTeamById'))
      ..add(DiagnosticsProperty('teamId', teamId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTeamByIdEvent &&
            (identical(other.teamId, teamId) || other.teamId == teamId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, teamId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTeamByIdEventCopyWith<_$GetTeamByIdEvent> get copyWith =>
      __$$GetTeamByIdEventCopyWithImpl<_$GetTeamByIdEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getTeamsByUserIdEvent,
    required TResult Function(String teamId) getTeamById,
    required TResult Function(String teamId, int maxMembers) getTeamMembers,
    required TResult Function(String teamId) getTeamJoinRequests,
    required TResult Function(String teamId, String userId) acceptJoinRequest,
    required TResult Function(String teamId, String userId) declineJoinRequest,
    required TResult Function(String teamId, String userId) kickMemberFromTeam,
    required TResult Function(String teamId, String? message, String? password)
        joinTeam,
    required TResult Function(String teamId) leaveTeam,
    required TResult Function(String teamId, String message) messageAllMembers,
    required TResult Function(String teamName, int page) searchTeamByName,
    required TResult Function(int page) getPopularTeams,
  }) {
    return getTeamById(teamId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getTeamsByUserIdEvent,
    TResult? Function(String teamId)? getTeamById,
    TResult? Function(String teamId, int maxMembers)? getTeamMembers,
    TResult? Function(String teamId)? getTeamJoinRequests,
    TResult? Function(String teamId, String userId)? acceptJoinRequest,
    TResult? Function(String teamId, String userId)? declineJoinRequest,
    TResult? Function(String teamId, String userId)? kickMemberFromTeam,
    TResult? Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult? Function(String teamId)? leaveTeam,
    TResult? Function(String teamId, String message)? messageAllMembers,
    TResult? Function(String teamName, int page)? searchTeamByName,
    TResult? Function(int page)? getPopularTeams,
  }) {
    return getTeamById?.call(teamId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getTeamsByUserIdEvent,
    TResult Function(String teamId)? getTeamById,
    TResult Function(String teamId, int maxMembers)? getTeamMembers,
    TResult Function(String teamId)? getTeamJoinRequests,
    TResult Function(String teamId, String userId)? acceptJoinRequest,
    TResult Function(String teamId, String userId)? declineJoinRequest,
    TResult Function(String teamId, String userId)? kickMemberFromTeam,
    TResult Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult Function(String teamId)? leaveTeam,
    TResult Function(String teamId, String message)? messageAllMembers,
    TResult Function(String teamName, int page)? searchTeamByName,
    TResult Function(int page)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (getTeamById != null) {
      return getTeamById(teamId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTeamsByUserIdEvent value)
        getTeamsByUserIdEvent,
    required TResult Function(GetTeamByIdEvent value) getTeamById,
    required TResult Function(GetTeamMembersEvent value) getTeamMembers,
    required TResult Function(GetTeamJoinRequestsEvent value)
        getTeamJoinRequests,
    required TResult Function(AcceptJoinRequestEvent value) acceptJoinRequest,
    required TResult Function(DeclineJoinRequestEvent value) declineJoinRequest,
    required TResult Function(KickMemberFromTeamEvent value) kickMemberFromTeam,
    required TResult Function(JoinTeamEvent value) joinTeam,
    required TResult Function(LeaveTeamEvent value) leaveTeam,
    required TResult Function(MessageAllMembersEvent value) messageAllMembers,
    required TResult Function(SearchTeamByNameEvent value) searchTeamByName,
    required TResult Function(GetPopularTeamsEvent value) getPopularTeams,
  }) {
    return getTeamById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult? Function(GetTeamByIdEvent value)? getTeamById,
    TResult? Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult? Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult? Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult? Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult? Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult? Function(JoinTeamEvent value)? joinTeam,
    TResult? Function(LeaveTeamEvent value)? leaveTeam,
    TResult? Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult? Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult? Function(GetPopularTeamsEvent value)? getPopularTeams,
  }) {
    return getTeamById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult Function(GetTeamByIdEvent value)? getTeamById,
    TResult Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult Function(JoinTeamEvent value)? joinTeam,
    TResult Function(LeaveTeamEvent value)? leaveTeam,
    TResult Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult Function(GetPopularTeamsEvent value)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (getTeamById != null) {
      return getTeamById(this);
    }
    return orElse();
  }
}

abstract class GetTeamByIdEvent implements TeamEvent {
  const factory GetTeamByIdEvent({required final String teamId}) =
      _$GetTeamByIdEvent;

  String get teamId;
  @JsonKey(ignore: true)
  _$$GetTeamByIdEventCopyWith<_$GetTeamByIdEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetTeamMembersEventCopyWith<$Res> {
  factory _$$GetTeamMembersEventCopyWith(_$GetTeamMembersEvent value,
          $Res Function(_$GetTeamMembersEvent) then) =
      __$$GetTeamMembersEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String teamId, int maxMembers});
}

/// @nodoc
class __$$GetTeamMembersEventCopyWithImpl<$Res>
    extends _$TeamEventCopyWithImpl<$Res, _$GetTeamMembersEvent>
    implements _$$GetTeamMembersEventCopyWith<$Res> {
  __$$GetTeamMembersEventCopyWithImpl(
      _$GetTeamMembersEvent _value, $Res Function(_$GetTeamMembersEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamId = null,
    Object? maxMembers = null,
  }) {
    return _then(_$GetTeamMembersEvent(
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      maxMembers: null == maxMembers
          ? _value.maxMembers
          : maxMembers // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetTeamMembersEvent
    with DiagnosticableTreeMixin
    implements GetTeamMembersEvent {
  const _$GetTeamMembersEvent({required this.teamId, this.maxMembers = 100});

  @override
  final String teamId;
  @override
  @JsonKey()
  final int maxMembers;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TeamEvent.getTeamMembers(teamId: $teamId, maxMembers: $maxMembers)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TeamEvent.getTeamMembers'))
      ..add(DiagnosticsProperty('teamId', teamId))
      ..add(DiagnosticsProperty('maxMembers', maxMembers));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTeamMembersEvent &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.maxMembers, maxMembers) ||
                other.maxMembers == maxMembers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, teamId, maxMembers);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTeamMembersEventCopyWith<_$GetTeamMembersEvent> get copyWith =>
      __$$GetTeamMembersEventCopyWithImpl<_$GetTeamMembersEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getTeamsByUserIdEvent,
    required TResult Function(String teamId) getTeamById,
    required TResult Function(String teamId, int maxMembers) getTeamMembers,
    required TResult Function(String teamId) getTeamJoinRequests,
    required TResult Function(String teamId, String userId) acceptJoinRequest,
    required TResult Function(String teamId, String userId) declineJoinRequest,
    required TResult Function(String teamId, String userId) kickMemberFromTeam,
    required TResult Function(String teamId, String? message, String? password)
        joinTeam,
    required TResult Function(String teamId) leaveTeam,
    required TResult Function(String teamId, String message) messageAllMembers,
    required TResult Function(String teamName, int page) searchTeamByName,
    required TResult Function(int page) getPopularTeams,
  }) {
    return getTeamMembers(teamId, maxMembers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getTeamsByUserIdEvent,
    TResult? Function(String teamId)? getTeamById,
    TResult? Function(String teamId, int maxMembers)? getTeamMembers,
    TResult? Function(String teamId)? getTeamJoinRequests,
    TResult? Function(String teamId, String userId)? acceptJoinRequest,
    TResult? Function(String teamId, String userId)? declineJoinRequest,
    TResult? Function(String teamId, String userId)? kickMemberFromTeam,
    TResult? Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult? Function(String teamId)? leaveTeam,
    TResult? Function(String teamId, String message)? messageAllMembers,
    TResult? Function(String teamName, int page)? searchTeamByName,
    TResult? Function(int page)? getPopularTeams,
  }) {
    return getTeamMembers?.call(teamId, maxMembers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getTeamsByUserIdEvent,
    TResult Function(String teamId)? getTeamById,
    TResult Function(String teamId, int maxMembers)? getTeamMembers,
    TResult Function(String teamId)? getTeamJoinRequests,
    TResult Function(String teamId, String userId)? acceptJoinRequest,
    TResult Function(String teamId, String userId)? declineJoinRequest,
    TResult Function(String teamId, String userId)? kickMemberFromTeam,
    TResult Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult Function(String teamId)? leaveTeam,
    TResult Function(String teamId, String message)? messageAllMembers,
    TResult Function(String teamName, int page)? searchTeamByName,
    TResult Function(int page)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (getTeamMembers != null) {
      return getTeamMembers(teamId, maxMembers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTeamsByUserIdEvent value)
        getTeamsByUserIdEvent,
    required TResult Function(GetTeamByIdEvent value) getTeamById,
    required TResult Function(GetTeamMembersEvent value) getTeamMembers,
    required TResult Function(GetTeamJoinRequestsEvent value)
        getTeamJoinRequests,
    required TResult Function(AcceptJoinRequestEvent value) acceptJoinRequest,
    required TResult Function(DeclineJoinRequestEvent value) declineJoinRequest,
    required TResult Function(KickMemberFromTeamEvent value) kickMemberFromTeam,
    required TResult Function(JoinTeamEvent value) joinTeam,
    required TResult Function(LeaveTeamEvent value) leaveTeam,
    required TResult Function(MessageAllMembersEvent value) messageAllMembers,
    required TResult Function(SearchTeamByNameEvent value) searchTeamByName,
    required TResult Function(GetPopularTeamsEvent value) getPopularTeams,
  }) {
    return getTeamMembers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult? Function(GetTeamByIdEvent value)? getTeamById,
    TResult? Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult? Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult? Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult? Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult? Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult? Function(JoinTeamEvent value)? joinTeam,
    TResult? Function(LeaveTeamEvent value)? leaveTeam,
    TResult? Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult? Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult? Function(GetPopularTeamsEvent value)? getPopularTeams,
  }) {
    return getTeamMembers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult Function(GetTeamByIdEvent value)? getTeamById,
    TResult Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult Function(JoinTeamEvent value)? joinTeam,
    TResult Function(LeaveTeamEvent value)? leaveTeam,
    TResult Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult Function(GetPopularTeamsEvent value)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (getTeamMembers != null) {
      return getTeamMembers(this);
    }
    return orElse();
  }
}

abstract class GetTeamMembersEvent implements TeamEvent {
  const factory GetTeamMembersEvent(
      {required final String teamId,
      final int maxMembers}) = _$GetTeamMembersEvent;

  String get teamId;
  int get maxMembers;
  @JsonKey(ignore: true)
  _$$GetTeamMembersEventCopyWith<_$GetTeamMembersEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetTeamJoinRequestsEventCopyWith<$Res> {
  factory _$$GetTeamJoinRequestsEventCopyWith(_$GetTeamJoinRequestsEvent value,
          $Res Function(_$GetTeamJoinRequestsEvent) then) =
      __$$GetTeamJoinRequestsEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String teamId});
}

/// @nodoc
class __$$GetTeamJoinRequestsEventCopyWithImpl<$Res>
    extends _$TeamEventCopyWithImpl<$Res, _$GetTeamJoinRequestsEvent>
    implements _$$GetTeamJoinRequestsEventCopyWith<$Res> {
  __$$GetTeamJoinRequestsEventCopyWithImpl(_$GetTeamJoinRequestsEvent _value,
      $Res Function(_$GetTeamJoinRequestsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamId = null,
  }) {
    return _then(_$GetTeamJoinRequestsEvent(
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetTeamJoinRequestsEvent
    with DiagnosticableTreeMixin
    implements GetTeamJoinRequestsEvent {
  const _$GetTeamJoinRequestsEvent({required this.teamId});

  @override
  final String teamId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TeamEvent.getTeamJoinRequests(teamId: $teamId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TeamEvent.getTeamJoinRequests'))
      ..add(DiagnosticsProperty('teamId', teamId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTeamJoinRequestsEvent &&
            (identical(other.teamId, teamId) || other.teamId == teamId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, teamId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTeamJoinRequestsEventCopyWith<_$GetTeamJoinRequestsEvent>
      get copyWith =>
          __$$GetTeamJoinRequestsEventCopyWithImpl<_$GetTeamJoinRequestsEvent>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getTeamsByUserIdEvent,
    required TResult Function(String teamId) getTeamById,
    required TResult Function(String teamId, int maxMembers) getTeamMembers,
    required TResult Function(String teamId) getTeamJoinRequests,
    required TResult Function(String teamId, String userId) acceptJoinRequest,
    required TResult Function(String teamId, String userId) declineJoinRequest,
    required TResult Function(String teamId, String userId) kickMemberFromTeam,
    required TResult Function(String teamId, String? message, String? password)
        joinTeam,
    required TResult Function(String teamId) leaveTeam,
    required TResult Function(String teamId, String message) messageAllMembers,
    required TResult Function(String teamName, int page) searchTeamByName,
    required TResult Function(int page) getPopularTeams,
  }) {
    return getTeamJoinRequests(teamId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getTeamsByUserIdEvent,
    TResult? Function(String teamId)? getTeamById,
    TResult? Function(String teamId, int maxMembers)? getTeamMembers,
    TResult? Function(String teamId)? getTeamJoinRequests,
    TResult? Function(String teamId, String userId)? acceptJoinRequest,
    TResult? Function(String teamId, String userId)? declineJoinRequest,
    TResult? Function(String teamId, String userId)? kickMemberFromTeam,
    TResult? Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult? Function(String teamId)? leaveTeam,
    TResult? Function(String teamId, String message)? messageAllMembers,
    TResult? Function(String teamName, int page)? searchTeamByName,
    TResult? Function(int page)? getPopularTeams,
  }) {
    return getTeamJoinRequests?.call(teamId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getTeamsByUserIdEvent,
    TResult Function(String teamId)? getTeamById,
    TResult Function(String teamId, int maxMembers)? getTeamMembers,
    TResult Function(String teamId)? getTeamJoinRequests,
    TResult Function(String teamId, String userId)? acceptJoinRequest,
    TResult Function(String teamId, String userId)? declineJoinRequest,
    TResult Function(String teamId, String userId)? kickMemberFromTeam,
    TResult Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult Function(String teamId)? leaveTeam,
    TResult Function(String teamId, String message)? messageAllMembers,
    TResult Function(String teamName, int page)? searchTeamByName,
    TResult Function(int page)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (getTeamJoinRequests != null) {
      return getTeamJoinRequests(teamId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTeamsByUserIdEvent value)
        getTeamsByUserIdEvent,
    required TResult Function(GetTeamByIdEvent value) getTeamById,
    required TResult Function(GetTeamMembersEvent value) getTeamMembers,
    required TResult Function(GetTeamJoinRequestsEvent value)
        getTeamJoinRequests,
    required TResult Function(AcceptJoinRequestEvent value) acceptJoinRequest,
    required TResult Function(DeclineJoinRequestEvent value) declineJoinRequest,
    required TResult Function(KickMemberFromTeamEvent value) kickMemberFromTeam,
    required TResult Function(JoinTeamEvent value) joinTeam,
    required TResult Function(LeaveTeamEvent value) leaveTeam,
    required TResult Function(MessageAllMembersEvent value) messageAllMembers,
    required TResult Function(SearchTeamByNameEvent value) searchTeamByName,
    required TResult Function(GetPopularTeamsEvent value) getPopularTeams,
  }) {
    return getTeamJoinRequests(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult? Function(GetTeamByIdEvent value)? getTeamById,
    TResult? Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult? Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult? Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult? Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult? Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult? Function(JoinTeamEvent value)? joinTeam,
    TResult? Function(LeaveTeamEvent value)? leaveTeam,
    TResult? Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult? Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult? Function(GetPopularTeamsEvent value)? getPopularTeams,
  }) {
    return getTeamJoinRequests?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult Function(GetTeamByIdEvent value)? getTeamById,
    TResult Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult Function(JoinTeamEvent value)? joinTeam,
    TResult Function(LeaveTeamEvent value)? leaveTeam,
    TResult Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult Function(GetPopularTeamsEvent value)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (getTeamJoinRequests != null) {
      return getTeamJoinRequests(this);
    }
    return orElse();
  }
}

abstract class GetTeamJoinRequestsEvent implements TeamEvent {
  const factory GetTeamJoinRequestsEvent({required final String teamId}) =
      _$GetTeamJoinRequestsEvent;

  String get teamId;
  @JsonKey(ignore: true)
  _$$GetTeamJoinRequestsEventCopyWith<_$GetTeamJoinRequestsEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AcceptJoinRequestEventCopyWith<$Res> {
  factory _$$AcceptJoinRequestEventCopyWith(_$AcceptJoinRequestEvent value,
          $Res Function(_$AcceptJoinRequestEvent) then) =
      __$$AcceptJoinRequestEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String teamId, String userId});
}

/// @nodoc
class __$$AcceptJoinRequestEventCopyWithImpl<$Res>
    extends _$TeamEventCopyWithImpl<$Res, _$AcceptJoinRequestEvent>
    implements _$$AcceptJoinRequestEventCopyWith<$Res> {
  __$$AcceptJoinRequestEventCopyWithImpl(_$AcceptJoinRequestEvent _value,
      $Res Function(_$AcceptJoinRequestEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamId = null,
    Object? userId = null,
  }) {
    return _then(_$AcceptJoinRequestEvent(
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AcceptJoinRequestEvent
    with DiagnosticableTreeMixin
    implements AcceptJoinRequestEvent {
  const _$AcceptJoinRequestEvent({required this.teamId, required this.userId});

  @override
  final String teamId;
  @override
  final String userId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TeamEvent.acceptJoinRequest(teamId: $teamId, userId: $userId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TeamEvent.acceptJoinRequest'))
      ..add(DiagnosticsProperty('teamId', teamId))
      ..add(DiagnosticsProperty('userId', userId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcceptJoinRequestEvent &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, teamId, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AcceptJoinRequestEventCopyWith<_$AcceptJoinRequestEvent> get copyWith =>
      __$$AcceptJoinRequestEventCopyWithImpl<_$AcceptJoinRequestEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getTeamsByUserIdEvent,
    required TResult Function(String teamId) getTeamById,
    required TResult Function(String teamId, int maxMembers) getTeamMembers,
    required TResult Function(String teamId) getTeamJoinRequests,
    required TResult Function(String teamId, String userId) acceptJoinRequest,
    required TResult Function(String teamId, String userId) declineJoinRequest,
    required TResult Function(String teamId, String userId) kickMemberFromTeam,
    required TResult Function(String teamId, String? message, String? password)
        joinTeam,
    required TResult Function(String teamId) leaveTeam,
    required TResult Function(String teamId, String message) messageAllMembers,
    required TResult Function(String teamName, int page) searchTeamByName,
    required TResult Function(int page) getPopularTeams,
  }) {
    return acceptJoinRequest(teamId, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getTeamsByUserIdEvent,
    TResult? Function(String teamId)? getTeamById,
    TResult? Function(String teamId, int maxMembers)? getTeamMembers,
    TResult? Function(String teamId)? getTeamJoinRequests,
    TResult? Function(String teamId, String userId)? acceptJoinRequest,
    TResult? Function(String teamId, String userId)? declineJoinRequest,
    TResult? Function(String teamId, String userId)? kickMemberFromTeam,
    TResult? Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult? Function(String teamId)? leaveTeam,
    TResult? Function(String teamId, String message)? messageAllMembers,
    TResult? Function(String teamName, int page)? searchTeamByName,
    TResult? Function(int page)? getPopularTeams,
  }) {
    return acceptJoinRequest?.call(teamId, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getTeamsByUserIdEvent,
    TResult Function(String teamId)? getTeamById,
    TResult Function(String teamId, int maxMembers)? getTeamMembers,
    TResult Function(String teamId)? getTeamJoinRequests,
    TResult Function(String teamId, String userId)? acceptJoinRequest,
    TResult Function(String teamId, String userId)? declineJoinRequest,
    TResult Function(String teamId, String userId)? kickMemberFromTeam,
    TResult Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult Function(String teamId)? leaveTeam,
    TResult Function(String teamId, String message)? messageAllMembers,
    TResult Function(String teamName, int page)? searchTeamByName,
    TResult Function(int page)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (acceptJoinRequest != null) {
      return acceptJoinRequest(teamId, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTeamsByUserIdEvent value)
        getTeamsByUserIdEvent,
    required TResult Function(GetTeamByIdEvent value) getTeamById,
    required TResult Function(GetTeamMembersEvent value) getTeamMembers,
    required TResult Function(GetTeamJoinRequestsEvent value)
        getTeamJoinRequests,
    required TResult Function(AcceptJoinRequestEvent value) acceptJoinRequest,
    required TResult Function(DeclineJoinRequestEvent value) declineJoinRequest,
    required TResult Function(KickMemberFromTeamEvent value) kickMemberFromTeam,
    required TResult Function(JoinTeamEvent value) joinTeam,
    required TResult Function(LeaveTeamEvent value) leaveTeam,
    required TResult Function(MessageAllMembersEvent value) messageAllMembers,
    required TResult Function(SearchTeamByNameEvent value) searchTeamByName,
    required TResult Function(GetPopularTeamsEvent value) getPopularTeams,
  }) {
    return acceptJoinRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult? Function(GetTeamByIdEvent value)? getTeamById,
    TResult? Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult? Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult? Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult? Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult? Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult? Function(JoinTeamEvent value)? joinTeam,
    TResult? Function(LeaveTeamEvent value)? leaveTeam,
    TResult? Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult? Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult? Function(GetPopularTeamsEvent value)? getPopularTeams,
  }) {
    return acceptJoinRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult Function(GetTeamByIdEvent value)? getTeamById,
    TResult Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult Function(JoinTeamEvent value)? joinTeam,
    TResult Function(LeaveTeamEvent value)? leaveTeam,
    TResult Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult Function(GetPopularTeamsEvent value)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (acceptJoinRequest != null) {
      return acceptJoinRequest(this);
    }
    return orElse();
  }
}

abstract class AcceptJoinRequestEvent implements TeamEvent {
  const factory AcceptJoinRequestEvent(
      {required final String teamId,
      required final String userId}) = _$AcceptJoinRequestEvent;

  String get teamId;
  String get userId;
  @JsonKey(ignore: true)
  _$$AcceptJoinRequestEventCopyWith<_$AcceptJoinRequestEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeclineJoinRequestEventCopyWith<$Res> {
  factory _$$DeclineJoinRequestEventCopyWith(_$DeclineJoinRequestEvent value,
          $Res Function(_$DeclineJoinRequestEvent) then) =
      __$$DeclineJoinRequestEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String teamId, String userId});
}

/// @nodoc
class __$$DeclineJoinRequestEventCopyWithImpl<$Res>
    extends _$TeamEventCopyWithImpl<$Res, _$DeclineJoinRequestEvent>
    implements _$$DeclineJoinRequestEventCopyWith<$Res> {
  __$$DeclineJoinRequestEventCopyWithImpl(_$DeclineJoinRequestEvent _value,
      $Res Function(_$DeclineJoinRequestEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamId = null,
    Object? userId = null,
  }) {
    return _then(_$DeclineJoinRequestEvent(
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeclineJoinRequestEvent
    with DiagnosticableTreeMixin
    implements DeclineJoinRequestEvent {
  const _$DeclineJoinRequestEvent({required this.teamId, required this.userId});

  @override
  final String teamId;
  @override
  final String userId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TeamEvent.declineJoinRequest(teamId: $teamId, userId: $userId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TeamEvent.declineJoinRequest'))
      ..add(DiagnosticsProperty('teamId', teamId))
      ..add(DiagnosticsProperty('userId', userId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeclineJoinRequestEvent &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, teamId, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeclineJoinRequestEventCopyWith<_$DeclineJoinRequestEvent> get copyWith =>
      __$$DeclineJoinRequestEventCopyWithImpl<_$DeclineJoinRequestEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getTeamsByUserIdEvent,
    required TResult Function(String teamId) getTeamById,
    required TResult Function(String teamId, int maxMembers) getTeamMembers,
    required TResult Function(String teamId) getTeamJoinRequests,
    required TResult Function(String teamId, String userId) acceptJoinRequest,
    required TResult Function(String teamId, String userId) declineJoinRequest,
    required TResult Function(String teamId, String userId) kickMemberFromTeam,
    required TResult Function(String teamId, String? message, String? password)
        joinTeam,
    required TResult Function(String teamId) leaveTeam,
    required TResult Function(String teamId, String message) messageAllMembers,
    required TResult Function(String teamName, int page) searchTeamByName,
    required TResult Function(int page) getPopularTeams,
  }) {
    return declineJoinRequest(teamId, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getTeamsByUserIdEvent,
    TResult? Function(String teamId)? getTeamById,
    TResult? Function(String teamId, int maxMembers)? getTeamMembers,
    TResult? Function(String teamId)? getTeamJoinRequests,
    TResult? Function(String teamId, String userId)? acceptJoinRequest,
    TResult? Function(String teamId, String userId)? declineJoinRequest,
    TResult? Function(String teamId, String userId)? kickMemberFromTeam,
    TResult? Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult? Function(String teamId)? leaveTeam,
    TResult? Function(String teamId, String message)? messageAllMembers,
    TResult? Function(String teamName, int page)? searchTeamByName,
    TResult? Function(int page)? getPopularTeams,
  }) {
    return declineJoinRequest?.call(teamId, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getTeamsByUserIdEvent,
    TResult Function(String teamId)? getTeamById,
    TResult Function(String teamId, int maxMembers)? getTeamMembers,
    TResult Function(String teamId)? getTeamJoinRequests,
    TResult Function(String teamId, String userId)? acceptJoinRequest,
    TResult Function(String teamId, String userId)? declineJoinRequest,
    TResult Function(String teamId, String userId)? kickMemberFromTeam,
    TResult Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult Function(String teamId)? leaveTeam,
    TResult Function(String teamId, String message)? messageAllMembers,
    TResult Function(String teamName, int page)? searchTeamByName,
    TResult Function(int page)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (declineJoinRequest != null) {
      return declineJoinRequest(teamId, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTeamsByUserIdEvent value)
        getTeamsByUserIdEvent,
    required TResult Function(GetTeamByIdEvent value) getTeamById,
    required TResult Function(GetTeamMembersEvent value) getTeamMembers,
    required TResult Function(GetTeamJoinRequestsEvent value)
        getTeamJoinRequests,
    required TResult Function(AcceptJoinRequestEvent value) acceptJoinRequest,
    required TResult Function(DeclineJoinRequestEvent value) declineJoinRequest,
    required TResult Function(KickMemberFromTeamEvent value) kickMemberFromTeam,
    required TResult Function(JoinTeamEvent value) joinTeam,
    required TResult Function(LeaveTeamEvent value) leaveTeam,
    required TResult Function(MessageAllMembersEvent value) messageAllMembers,
    required TResult Function(SearchTeamByNameEvent value) searchTeamByName,
    required TResult Function(GetPopularTeamsEvent value) getPopularTeams,
  }) {
    return declineJoinRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult? Function(GetTeamByIdEvent value)? getTeamById,
    TResult? Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult? Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult? Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult? Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult? Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult? Function(JoinTeamEvent value)? joinTeam,
    TResult? Function(LeaveTeamEvent value)? leaveTeam,
    TResult? Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult? Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult? Function(GetPopularTeamsEvent value)? getPopularTeams,
  }) {
    return declineJoinRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult Function(GetTeamByIdEvent value)? getTeamById,
    TResult Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult Function(JoinTeamEvent value)? joinTeam,
    TResult Function(LeaveTeamEvent value)? leaveTeam,
    TResult Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult Function(GetPopularTeamsEvent value)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (declineJoinRequest != null) {
      return declineJoinRequest(this);
    }
    return orElse();
  }
}

abstract class DeclineJoinRequestEvent implements TeamEvent {
  const factory DeclineJoinRequestEvent(
      {required final String teamId,
      required final String userId}) = _$DeclineJoinRequestEvent;

  String get teamId;
  String get userId;
  @JsonKey(ignore: true)
  _$$DeclineJoinRequestEventCopyWith<_$DeclineJoinRequestEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$KickMemberFromTeamEventCopyWith<$Res> {
  factory _$$KickMemberFromTeamEventCopyWith(_$KickMemberFromTeamEvent value,
          $Res Function(_$KickMemberFromTeamEvent) then) =
      __$$KickMemberFromTeamEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String teamId, String userId});
}

/// @nodoc
class __$$KickMemberFromTeamEventCopyWithImpl<$Res>
    extends _$TeamEventCopyWithImpl<$Res, _$KickMemberFromTeamEvent>
    implements _$$KickMemberFromTeamEventCopyWith<$Res> {
  __$$KickMemberFromTeamEventCopyWithImpl(_$KickMemberFromTeamEvent _value,
      $Res Function(_$KickMemberFromTeamEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamId = null,
    Object? userId = null,
  }) {
    return _then(_$KickMemberFromTeamEvent(
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$KickMemberFromTeamEvent
    with DiagnosticableTreeMixin
    implements KickMemberFromTeamEvent {
  const _$KickMemberFromTeamEvent({required this.teamId, required this.userId});

  @override
  final String teamId;
  @override
  final String userId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TeamEvent.kickMemberFromTeam(teamId: $teamId, userId: $userId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TeamEvent.kickMemberFromTeam'))
      ..add(DiagnosticsProperty('teamId', teamId))
      ..add(DiagnosticsProperty('userId', userId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KickMemberFromTeamEvent &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, teamId, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KickMemberFromTeamEventCopyWith<_$KickMemberFromTeamEvent> get copyWith =>
      __$$KickMemberFromTeamEventCopyWithImpl<_$KickMemberFromTeamEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getTeamsByUserIdEvent,
    required TResult Function(String teamId) getTeamById,
    required TResult Function(String teamId, int maxMembers) getTeamMembers,
    required TResult Function(String teamId) getTeamJoinRequests,
    required TResult Function(String teamId, String userId) acceptJoinRequest,
    required TResult Function(String teamId, String userId) declineJoinRequest,
    required TResult Function(String teamId, String userId) kickMemberFromTeam,
    required TResult Function(String teamId, String? message, String? password)
        joinTeam,
    required TResult Function(String teamId) leaveTeam,
    required TResult Function(String teamId, String message) messageAllMembers,
    required TResult Function(String teamName, int page) searchTeamByName,
    required TResult Function(int page) getPopularTeams,
  }) {
    return kickMemberFromTeam(teamId, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getTeamsByUserIdEvent,
    TResult? Function(String teamId)? getTeamById,
    TResult? Function(String teamId, int maxMembers)? getTeamMembers,
    TResult? Function(String teamId)? getTeamJoinRequests,
    TResult? Function(String teamId, String userId)? acceptJoinRequest,
    TResult? Function(String teamId, String userId)? declineJoinRequest,
    TResult? Function(String teamId, String userId)? kickMemberFromTeam,
    TResult? Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult? Function(String teamId)? leaveTeam,
    TResult? Function(String teamId, String message)? messageAllMembers,
    TResult? Function(String teamName, int page)? searchTeamByName,
    TResult? Function(int page)? getPopularTeams,
  }) {
    return kickMemberFromTeam?.call(teamId, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getTeamsByUserIdEvent,
    TResult Function(String teamId)? getTeamById,
    TResult Function(String teamId, int maxMembers)? getTeamMembers,
    TResult Function(String teamId)? getTeamJoinRequests,
    TResult Function(String teamId, String userId)? acceptJoinRequest,
    TResult Function(String teamId, String userId)? declineJoinRequest,
    TResult Function(String teamId, String userId)? kickMemberFromTeam,
    TResult Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult Function(String teamId)? leaveTeam,
    TResult Function(String teamId, String message)? messageAllMembers,
    TResult Function(String teamName, int page)? searchTeamByName,
    TResult Function(int page)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (kickMemberFromTeam != null) {
      return kickMemberFromTeam(teamId, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTeamsByUserIdEvent value)
        getTeamsByUserIdEvent,
    required TResult Function(GetTeamByIdEvent value) getTeamById,
    required TResult Function(GetTeamMembersEvent value) getTeamMembers,
    required TResult Function(GetTeamJoinRequestsEvent value)
        getTeamJoinRequests,
    required TResult Function(AcceptJoinRequestEvent value) acceptJoinRequest,
    required TResult Function(DeclineJoinRequestEvent value) declineJoinRequest,
    required TResult Function(KickMemberFromTeamEvent value) kickMemberFromTeam,
    required TResult Function(JoinTeamEvent value) joinTeam,
    required TResult Function(LeaveTeamEvent value) leaveTeam,
    required TResult Function(MessageAllMembersEvent value) messageAllMembers,
    required TResult Function(SearchTeamByNameEvent value) searchTeamByName,
    required TResult Function(GetPopularTeamsEvent value) getPopularTeams,
  }) {
    return kickMemberFromTeam(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult? Function(GetTeamByIdEvent value)? getTeamById,
    TResult? Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult? Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult? Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult? Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult? Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult? Function(JoinTeamEvent value)? joinTeam,
    TResult? Function(LeaveTeamEvent value)? leaveTeam,
    TResult? Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult? Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult? Function(GetPopularTeamsEvent value)? getPopularTeams,
  }) {
    return kickMemberFromTeam?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult Function(GetTeamByIdEvent value)? getTeamById,
    TResult Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult Function(JoinTeamEvent value)? joinTeam,
    TResult Function(LeaveTeamEvent value)? leaveTeam,
    TResult Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult Function(GetPopularTeamsEvent value)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (kickMemberFromTeam != null) {
      return kickMemberFromTeam(this);
    }
    return orElse();
  }
}

abstract class KickMemberFromTeamEvent implements TeamEvent {
  const factory KickMemberFromTeamEvent(
      {required final String teamId,
      required final String userId}) = _$KickMemberFromTeamEvent;

  String get teamId;
  String get userId;
  @JsonKey(ignore: true)
  _$$KickMemberFromTeamEventCopyWith<_$KickMemberFromTeamEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$JoinTeamEventCopyWith<$Res> {
  factory _$$JoinTeamEventCopyWith(
          _$JoinTeamEvent value, $Res Function(_$JoinTeamEvent) then) =
      __$$JoinTeamEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String teamId, String? message, String? password});
}

/// @nodoc
class __$$JoinTeamEventCopyWithImpl<$Res>
    extends _$TeamEventCopyWithImpl<$Res, _$JoinTeamEvent>
    implements _$$JoinTeamEventCopyWith<$Res> {
  __$$JoinTeamEventCopyWithImpl(
      _$JoinTeamEvent _value, $Res Function(_$JoinTeamEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamId = null,
    Object? message = freezed,
    Object? password = freezed,
  }) {
    return _then(_$JoinTeamEvent(
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$JoinTeamEvent with DiagnosticableTreeMixin implements JoinTeamEvent {
  const _$JoinTeamEvent({required this.teamId, this.message, this.password});

  @override
  final String teamId;

  /// If the team requries a message, a [LichessOAuthFailure]
  /// will be thrown with error code 400, that may means that
  /// the team requires a message, so you can try again with
  /// a message with a minimum length of 30 characters.
  @override
  final String? message;
  @override
  final String? password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TeamEvent.joinTeam(teamId: $teamId, message: $message, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TeamEvent.joinTeam'))
      ..add(DiagnosticsProperty('teamId', teamId))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinTeamEvent &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, teamId, message, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinTeamEventCopyWith<_$JoinTeamEvent> get copyWith =>
      __$$JoinTeamEventCopyWithImpl<_$JoinTeamEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getTeamsByUserIdEvent,
    required TResult Function(String teamId) getTeamById,
    required TResult Function(String teamId, int maxMembers) getTeamMembers,
    required TResult Function(String teamId) getTeamJoinRequests,
    required TResult Function(String teamId, String userId) acceptJoinRequest,
    required TResult Function(String teamId, String userId) declineJoinRequest,
    required TResult Function(String teamId, String userId) kickMemberFromTeam,
    required TResult Function(String teamId, String? message, String? password)
        joinTeam,
    required TResult Function(String teamId) leaveTeam,
    required TResult Function(String teamId, String message) messageAllMembers,
    required TResult Function(String teamName, int page) searchTeamByName,
    required TResult Function(int page) getPopularTeams,
  }) {
    return joinTeam(teamId, message, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getTeamsByUserIdEvent,
    TResult? Function(String teamId)? getTeamById,
    TResult? Function(String teamId, int maxMembers)? getTeamMembers,
    TResult? Function(String teamId)? getTeamJoinRequests,
    TResult? Function(String teamId, String userId)? acceptJoinRequest,
    TResult? Function(String teamId, String userId)? declineJoinRequest,
    TResult? Function(String teamId, String userId)? kickMemberFromTeam,
    TResult? Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult? Function(String teamId)? leaveTeam,
    TResult? Function(String teamId, String message)? messageAllMembers,
    TResult? Function(String teamName, int page)? searchTeamByName,
    TResult? Function(int page)? getPopularTeams,
  }) {
    return joinTeam?.call(teamId, message, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getTeamsByUserIdEvent,
    TResult Function(String teamId)? getTeamById,
    TResult Function(String teamId, int maxMembers)? getTeamMembers,
    TResult Function(String teamId)? getTeamJoinRequests,
    TResult Function(String teamId, String userId)? acceptJoinRequest,
    TResult Function(String teamId, String userId)? declineJoinRequest,
    TResult Function(String teamId, String userId)? kickMemberFromTeam,
    TResult Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult Function(String teamId)? leaveTeam,
    TResult Function(String teamId, String message)? messageAllMembers,
    TResult Function(String teamName, int page)? searchTeamByName,
    TResult Function(int page)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (joinTeam != null) {
      return joinTeam(teamId, message, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTeamsByUserIdEvent value)
        getTeamsByUserIdEvent,
    required TResult Function(GetTeamByIdEvent value) getTeamById,
    required TResult Function(GetTeamMembersEvent value) getTeamMembers,
    required TResult Function(GetTeamJoinRequestsEvent value)
        getTeamJoinRequests,
    required TResult Function(AcceptJoinRequestEvent value) acceptJoinRequest,
    required TResult Function(DeclineJoinRequestEvent value) declineJoinRequest,
    required TResult Function(KickMemberFromTeamEvent value) kickMemberFromTeam,
    required TResult Function(JoinTeamEvent value) joinTeam,
    required TResult Function(LeaveTeamEvent value) leaveTeam,
    required TResult Function(MessageAllMembersEvent value) messageAllMembers,
    required TResult Function(SearchTeamByNameEvent value) searchTeamByName,
    required TResult Function(GetPopularTeamsEvent value) getPopularTeams,
  }) {
    return joinTeam(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult? Function(GetTeamByIdEvent value)? getTeamById,
    TResult? Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult? Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult? Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult? Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult? Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult? Function(JoinTeamEvent value)? joinTeam,
    TResult? Function(LeaveTeamEvent value)? leaveTeam,
    TResult? Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult? Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult? Function(GetPopularTeamsEvent value)? getPopularTeams,
  }) {
    return joinTeam?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult Function(GetTeamByIdEvent value)? getTeamById,
    TResult Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult Function(JoinTeamEvent value)? joinTeam,
    TResult Function(LeaveTeamEvent value)? leaveTeam,
    TResult Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult Function(GetPopularTeamsEvent value)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (joinTeam != null) {
      return joinTeam(this);
    }
    return orElse();
  }
}

abstract class JoinTeamEvent implements TeamEvent {
  const factory JoinTeamEvent(
      {required final String teamId,
      final String? message,
      final String? password}) = _$JoinTeamEvent;

  String get teamId;

  /// If the team requries a message, a [LichessOAuthFailure]
  /// will be thrown with error code 400, that may means that
  /// the team requires a message, so you can try again with
  /// a message with a minimum length of 30 characters.
  String? get message;
  String? get password;
  @JsonKey(ignore: true)
  _$$JoinTeamEventCopyWith<_$JoinTeamEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LeaveTeamEventCopyWith<$Res> {
  factory _$$LeaveTeamEventCopyWith(
          _$LeaveTeamEvent value, $Res Function(_$LeaveTeamEvent) then) =
      __$$LeaveTeamEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String teamId});
}

/// @nodoc
class __$$LeaveTeamEventCopyWithImpl<$Res>
    extends _$TeamEventCopyWithImpl<$Res, _$LeaveTeamEvent>
    implements _$$LeaveTeamEventCopyWith<$Res> {
  __$$LeaveTeamEventCopyWithImpl(
      _$LeaveTeamEvent _value, $Res Function(_$LeaveTeamEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamId = null,
  }) {
    return _then(_$LeaveTeamEvent(
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LeaveTeamEvent with DiagnosticableTreeMixin implements LeaveTeamEvent {
  const _$LeaveTeamEvent({required this.teamId});

  @override
  final String teamId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TeamEvent.leaveTeam(teamId: $teamId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TeamEvent.leaveTeam'))
      ..add(DiagnosticsProperty('teamId', teamId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveTeamEvent &&
            (identical(other.teamId, teamId) || other.teamId == teamId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, teamId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveTeamEventCopyWith<_$LeaveTeamEvent> get copyWith =>
      __$$LeaveTeamEventCopyWithImpl<_$LeaveTeamEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getTeamsByUserIdEvent,
    required TResult Function(String teamId) getTeamById,
    required TResult Function(String teamId, int maxMembers) getTeamMembers,
    required TResult Function(String teamId) getTeamJoinRequests,
    required TResult Function(String teamId, String userId) acceptJoinRequest,
    required TResult Function(String teamId, String userId) declineJoinRequest,
    required TResult Function(String teamId, String userId) kickMemberFromTeam,
    required TResult Function(String teamId, String? message, String? password)
        joinTeam,
    required TResult Function(String teamId) leaveTeam,
    required TResult Function(String teamId, String message) messageAllMembers,
    required TResult Function(String teamName, int page) searchTeamByName,
    required TResult Function(int page) getPopularTeams,
  }) {
    return leaveTeam(teamId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getTeamsByUserIdEvent,
    TResult? Function(String teamId)? getTeamById,
    TResult? Function(String teamId, int maxMembers)? getTeamMembers,
    TResult? Function(String teamId)? getTeamJoinRequests,
    TResult? Function(String teamId, String userId)? acceptJoinRequest,
    TResult? Function(String teamId, String userId)? declineJoinRequest,
    TResult? Function(String teamId, String userId)? kickMemberFromTeam,
    TResult? Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult? Function(String teamId)? leaveTeam,
    TResult? Function(String teamId, String message)? messageAllMembers,
    TResult? Function(String teamName, int page)? searchTeamByName,
    TResult? Function(int page)? getPopularTeams,
  }) {
    return leaveTeam?.call(teamId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getTeamsByUserIdEvent,
    TResult Function(String teamId)? getTeamById,
    TResult Function(String teamId, int maxMembers)? getTeamMembers,
    TResult Function(String teamId)? getTeamJoinRequests,
    TResult Function(String teamId, String userId)? acceptJoinRequest,
    TResult Function(String teamId, String userId)? declineJoinRequest,
    TResult Function(String teamId, String userId)? kickMemberFromTeam,
    TResult Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult Function(String teamId)? leaveTeam,
    TResult Function(String teamId, String message)? messageAllMembers,
    TResult Function(String teamName, int page)? searchTeamByName,
    TResult Function(int page)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (leaveTeam != null) {
      return leaveTeam(teamId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTeamsByUserIdEvent value)
        getTeamsByUserIdEvent,
    required TResult Function(GetTeamByIdEvent value) getTeamById,
    required TResult Function(GetTeamMembersEvent value) getTeamMembers,
    required TResult Function(GetTeamJoinRequestsEvent value)
        getTeamJoinRequests,
    required TResult Function(AcceptJoinRequestEvent value) acceptJoinRequest,
    required TResult Function(DeclineJoinRequestEvent value) declineJoinRequest,
    required TResult Function(KickMemberFromTeamEvent value) kickMemberFromTeam,
    required TResult Function(JoinTeamEvent value) joinTeam,
    required TResult Function(LeaveTeamEvent value) leaveTeam,
    required TResult Function(MessageAllMembersEvent value) messageAllMembers,
    required TResult Function(SearchTeamByNameEvent value) searchTeamByName,
    required TResult Function(GetPopularTeamsEvent value) getPopularTeams,
  }) {
    return leaveTeam(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult? Function(GetTeamByIdEvent value)? getTeamById,
    TResult? Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult? Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult? Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult? Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult? Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult? Function(JoinTeamEvent value)? joinTeam,
    TResult? Function(LeaveTeamEvent value)? leaveTeam,
    TResult? Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult? Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult? Function(GetPopularTeamsEvent value)? getPopularTeams,
  }) {
    return leaveTeam?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult Function(GetTeamByIdEvent value)? getTeamById,
    TResult Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult Function(JoinTeamEvent value)? joinTeam,
    TResult Function(LeaveTeamEvent value)? leaveTeam,
    TResult Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult Function(GetPopularTeamsEvent value)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (leaveTeam != null) {
      return leaveTeam(this);
    }
    return orElse();
  }
}

abstract class LeaveTeamEvent implements TeamEvent {
  const factory LeaveTeamEvent({required final String teamId}) =
      _$LeaveTeamEvent;

  String get teamId;
  @JsonKey(ignore: true)
  _$$LeaveTeamEventCopyWith<_$LeaveTeamEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessageAllMembersEventCopyWith<$Res> {
  factory _$$MessageAllMembersEventCopyWith(_$MessageAllMembersEvent value,
          $Res Function(_$MessageAllMembersEvent) then) =
      __$$MessageAllMembersEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String teamId, String message});
}

/// @nodoc
class __$$MessageAllMembersEventCopyWithImpl<$Res>
    extends _$TeamEventCopyWithImpl<$Res, _$MessageAllMembersEvent>
    implements _$$MessageAllMembersEventCopyWith<$Res> {
  __$$MessageAllMembersEventCopyWithImpl(_$MessageAllMembersEvent _value,
      $Res Function(_$MessageAllMembersEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamId = null,
    Object? message = null,
  }) {
    return _then(_$MessageAllMembersEvent(
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MessageAllMembersEvent
    with DiagnosticableTreeMixin
    implements MessageAllMembersEvent {
  const _$MessageAllMembersEvent({required this.teamId, required this.message});

  @override
  final String teamId;
  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TeamEvent.messageAllMembers(teamId: $teamId, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TeamEvent.messageAllMembers'))
      ..add(DiagnosticsProperty('teamId', teamId))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageAllMembersEvent &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, teamId, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageAllMembersEventCopyWith<_$MessageAllMembersEvent> get copyWith =>
      __$$MessageAllMembersEventCopyWithImpl<_$MessageAllMembersEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getTeamsByUserIdEvent,
    required TResult Function(String teamId) getTeamById,
    required TResult Function(String teamId, int maxMembers) getTeamMembers,
    required TResult Function(String teamId) getTeamJoinRequests,
    required TResult Function(String teamId, String userId) acceptJoinRequest,
    required TResult Function(String teamId, String userId) declineJoinRequest,
    required TResult Function(String teamId, String userId) kickMemberFromTeam,
    required TResult Function(String teamId, String? message, String? password)
        joinTeam,
    required TResult Function(String teamId) leaveTeam,
    required TResult Function(String teamId, String message) messageAllMembers,
    required TResult Function(String teamName, int page) searchTeamByName,
    required TResult Function(int page) getPopularTeams,
  }) {
    return messageAllMembers(teamId, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getTeamsByUserIdEvent,
    TResult? Function(String teamId)? getTeamById,
    TResult? Function(String teamId, int maxMembers)? getTeamMembers,
    TResult? Function(String teamId)? getTeamJoinRequests,
    TResult? Function(String teamId, String userId)? acceptJoinRequest,
    TResult? Function(String teamId, String userId)? declineJoinRequest,
    TResult? Function(String teamId, String userId)? kickMemberFromTeam,
    TResult? Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult? Function(String teamId)? leaveTeam,
    TResult? Function(String teamId, String message)? messageAllMembers,
    TResult? Function(String teamName, int page)? searchTeamByName,
    TResult? Function(int page)? getPopularTeams,
  }) {
    return messageAllMembers?.call(teamId, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getTeamsByUserIdEvent,
    TResult Function(String teamId)? getTeamById,
    TResult Function(String teamId, int maxMembers)? getTeamMembers,
    TResult Function(String teamId)? getTeamJoinRequests,
    TResult Function(String teamId, String userId)? acceptJoinRequest,
    TResult Function(String teamId, String userId)? declineJoinRequest,
    TResult Function(String teamId, String userId)? kickMemberFromTeam,
    TResult Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult Function(String teamId)? leaveTeam,
    TResult Function(String teamId, String message)? messageAllMembers,
    TResult Function(String teamName, int page)? searchTeamByName,
    TResult Function(int page)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (messageAllMembers != null) {
      return messageAllMembers(teamId, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTeamsByUserIdEvent value)
        getTeamsByUserIdEvent,
    required TResult Function(GetTeamByIdEvent value) getTeamById,
    required TResult Function(GetTeamMembersEvent value) getTeamMembers,
    required TResult Function(GetTeamJoinRequestsEvent value)
        getTeamJoinRequests,
    required TResult Function(AcceptJoinRequestEvent value) acceptJoinRequest,
    required TResult Function(DeclineJoinRequestEvent value) declineJoinRequest,
    required TResult Function(KickMemberFromTeamEvent value) kickMemberFromTeam,
    required TResult Function(JoinTeamEvent value) joinTeam,
    required TResult Function(LeaveTeamEvent value) leaveTeam,
    required TResult Function(MessageAllMembersEvent value) messageAllMembers,
    required TResult Function(SearchTeamByNameEvent value) searchTeamByName,
    required TResult Function(GetPopularTeamsEvent value) getPopularTeams,
  }) {
    return messageAllMembers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult? Function(GetTeamByIdEvent value)? getTeamById,
    TResult? Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult? Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult? Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult? Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult? Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult? Function(JoinTeamEvent value)? joinTeam,
    TResult? Function(LeaveTeamEvent value)? leaveTeam,
    TResult? Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult? Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult? Function(GetPopularTeamsEvent value)? getPopularTeams,
  }) {
    return messageAllMembers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult Function(GetTeamByIdEvent value)? getTeamById,
    TResult Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult Function(JoinTeamEvent value)? joinTeam,
    TResult Function(LeaveTeamEvent value)? leaveTeam,
    TResult Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult Function(GetPopularTeamsEvent value)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (messageAllMembers != null) {
      return messageAllMembers(this);
    }
    return orElse();
  }
}

abstract class MessageAllMembersEvent implements TeamEvent {
  const factory MessageAllMembersEvent(
      {required final String teamId,
      required final String message}) = _$MessageAllMembersEvent;

  String get teamId;
  String get message;
  @JsonKey(ignore: true)
  _$$MessageAllMembersEventCopyWith<_$MessageAllMembersEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchTeamByNameEventCopyWith<$Res> {
  factory _$$SearchTeamByNameEventCopyWith(_$SearchTeamByNameEvent value,
          $Res Function(_$SearchTeamByNameEvent) then) =
      __$$SearchTeamByNameEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String teamName, int page});
}

/// @nodoc
class __$$SearchTeamByNameEventCopyWithImpl<$Res>
    extends _$TeamEventCopyWithImpl<$Res, _$SearchTeamByNameEvent>
    implements _$$SearchTeamByNameEventCopyWith<$Res> {
  __$$SearchTeamByNameEventCopyWithImpl(_$SearchTeamByNameEvent _value,
      $Res Function(_$SearchTeamByNameEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teamName = null,
    Object? page = null,
  }) {
    return _then(_$SearchTeamByNameEvent(
      teamName: null == teamName
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SearchTeamByNameEvent
    with DiagnosticableTreeMixin
    implements SearchTeamByNameEvent {
  const _$SearchTeamByNameEvent({required this.teamName, this.page = 1});

  @override
  final String teamName;
  @override
  @JsonKey()
  final int page;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TeamEvent.searchTeamByName(teamName: $teamName, page: $page)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TeamEvent.searchTeamByName'))
      ..add(DiagnosticsProperty('teamName', teamName))
      ..add(DiagnosticsProperty('page', page));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchTeamByNameEvent &&
            (identical(other.teamName, teamName) ||
                other.teamName == teamName) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, teamName, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchTeamByNameEventCopyWith<_$SearchTeamByNameEvent> get copyWith =>
      __$$SearchTeamByNameEventCopyWithImpl<_$SearchTeamByNameEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getTeamsByUserIdEvent,
    required TResult Function(String teamId) getTeamById,
    required TResult Function(String teamId, int maxMembers) getTeamMembers,
    required TResult Function(String teamId) getTeamJoinRequests,
    required TResult Function(String teamId, String userId) acceptJoinRequest,
    required TResult Function(String teamId, String userId) declineJoinRequest,
    required TResult Function(String teamId, String userId) kickMemberFromTeam,
    required TResult Function(String teamId, String? message, String? password)
        joinTeam,
    required TResult Function(String teamId) leaveTeam,
    required TResult Function(String teamId, String message) messageAllMembers,
    required TResult Function(String teamName, int page) searchTeamByName,
    required TResult Function(int page) getPopularTeams,
  }) {
    return searchTeamByName(teamName, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getTeamsByUserIdEvent,
    TResult? Function(String teamId)? getTeamById,
    TResult? Function(String teamId, int maxMembers)? getTeamMembers,
    TResult? Function(String teamId)? getTeamJoinRequests,
    TResult? Function(String teamId, String userId)? acceptJoinRequest,
    TResult? Function(String teamId, String userId)? declineJoinRequest,
    TResult? Function(String teamId, String userId)? kickMemberFromTeam,
    TResult? Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult? Function(String teamId)? leaveTeam,
    TResult? Function(String teamId, String message)? messageAllMembers,
    TResult? Function(String teamName, int page)? searchTeamByName,
    TResult? Function(int page)? getPopularTeams,
  }) {
    return searchTeamByName?.call(teamName, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getTeamsByUserIdEvent,
    TResult Function(String teamId)? getTeamById,
    TResult Function(String teamId, int maxMembers)? getTeamMembers,
    TResult Function(String teamId)? getTeamJoinRequests,
    TResult Function(String teamId, String userId)? acceptJoinRequest,
    TResult Function(String teamId, String userId)? declineJoinRequest,
    TResult Function(String teamId, String userId)? kickMemberFromTeam,
    TResult Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult Function(String teamId)? leaveTeam,
    TResult Function(String teamId, String message)? messageAllMembers,
    TResult Function(String teamName, int page)? searchTeamByName,
    TResult Function(int page)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (searchTeamByName != null) {
      return searchTeamByName(teamName, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTeamsByUserIdEvent value)
        getTeamsByUserIdEvent,
    required TResult Function(GetTeamByIdEvent value) getTeamById,
    required TResult Function(GetTeamMembersEvent value) getTeamMembers,
    required TResult Function(GetTeamJoinRequestsEvent value)
        getTeamJoinRequests,
    required TResult Function(AcceptJoinRequestEvent value) acceptJoinRequest,
    required TResult Function(DeclineJoinRequestEvent value) declineJoinRequest,
    required TResult Function(KickMemberFromTeamEvent value) kickMemberFromTeam,
    required TResult Function(JoinTeamEvent value) joinTeam,
    required TResult Function(LeaveTeamEvent value) leaveTeam,
    required TResult Function(MessageAllMembersEvent value) messageAllMembers,
    required TResult Function(SearchTeamByNameEvent value) searchTeamByName,
    required TResult Function(GetPopularTeamsEvent value) getPopularTeams,
  }) {
    return searchTeamByName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult? Function(GetTeamByIdEvent value)? getTeamById,
    TResult? Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult? Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult? Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult? Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult? Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult? Function(JoinTeamEvent value)? joinTeam,
    TResult? Function(LeaveTeamEvent value)? leaveTeam,
    TResult? Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult? Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult? Function(GetPopularTeamsEvent value)? getPopularTeams,
  }) {
    return searchTeamByName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult Function(GetTeamByIdEvent value)? getTeamById,
    TResult Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult Function(JoinTeamEvent value)? joinTeam,
    TResult Function(LeaveTeamEvent value)? leaveTeam,
    TResult Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult Function(GetPopularTeamsEvent value)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (searchTeamByName != null) {
      return searchTeamByName(this);
    }
    return orElse();
  }
}

abstract class SearchTeamByNameEvent implements TeamEvent {
  const factory SearchTeamByNameEvent(
      {required final String teamName,
      final int page}) = _$SearchTeamByNameEvent;

  String get teamName;
  int get page;
  @JsonKey(ignore: true)
  _$$SearchTeamByNameEventCopyWith<_$SearchTeamByNameEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetPopularTeamsEventCopyWith<$Res> {
  factory _$$GetPopularTeamsEventCopyWith(_$GetPopularTeamsEvent value,
          $Res Function(_$GetPopularTeamsEvent) then) =
      __$$GetPopularTeamsEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$GetPopularTeamsEventCopyWithImpl<$Res>
    extends _$TeamEventCopyWithImpl<$Res, _$GetPopularTeamsEvent>
    implements _$$GetPopularTeamsEventCopyWith<$Res> {
  __$$GetPopularTeamsEventCopyWithImpl(_$GetPopularTeamsEvent _value,
      $Res Function(_$GetPopularTeamsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$GetPopularTeamsEvent(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetPopularTeamsEvent
    with DiagnosticableTreeMixin
    implements GetPopularTeamsEvent {
  const _$GetPopularTeamsEvent({this.page = 1});

  @override
  @JsonKey()
  final int page;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TeamEvent.getPopularTeams(page: $page)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TeamEvent.getPopularTeams'))
      ..add(DiagnosticsProperty('page', page));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPopularTeamsEvent &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPopularTeamsEventCopyWith<_$GetPopularTeamsEvent> get copyWith =>
      __$$GetPopularTeamsEventCopyWithImpl<_$GetPopularTeamsEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getTeamsByUserIdEvent,
    required TResult Function(String teamId) getTeamById,
    required TResult Function(String teamId, int maxMembers) getTeamMembers,
    required TResult Function(String teamId) getTeamJoinRequests,
    required TResult Function(String teamId, String userId) acceptJoinRequest,
    required TResult Function(String teamId, String userId) declineJoinRequest,
    required TResult Function(String teamId, String userId) kickMemberFromTeam,
    required TResult Function(String teamId, String? message, String? password)
        joinTeam,
    required TResult Function(String teamId) leaveTeam,
    required TResult Function(String teamId, String message) messageAllMembers,
    required TResult Function(String teamName, int page) searchTeamByName,
    required TResult Function(int page) getPopularTeams,
  }) {
    return getPopularTeams(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getTeamsByUserIdEvent,
    TResult? Function(String teamId)? getTeamById,
    TResult? Function(String teamId, int maxMembers)? getTeamMembers,
    TResult? Function(String teamId)? getTeamJoinRequests,
    TResult? Function(String teamId, String userId)? acceptJoinRequest,
    TResult? Function(String teamId, String userId)? declineJoinRequest,
    TResult? Function(String teamId, String userId)? kickMemberFromTeam,
    TResult? Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult? Function(String teamId)? leaveTeam,
    TResult? Function(String teamId, String message)? messageAllMembers,
    TResult? Function(String teamName, int page)? searchTeamByName,
    TResult? Function(int page)? getPopularTeams,
  }) {
    return getPopularTeams?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getTeamsByUserIdEvent,
    TResult Function(String teamId)? getTeamById,
    TResult Function(String teamId, int maxMembers)? getTeamMembers,
    TResult Function(String teamId)? getTeamJoinRequests,
    TResult Function(String teamId, String userId)? acceptJoinRequest,
    TResult Function(String teamId, String userId)? declineJoinRequest,
    TResult Function(String teamId, String userId)? kickMemberFromTeam,
    TResult Function(String teamId, String? message, String? password)?
        joinTeam,
    TResult Function(String teamId)? leaveTeam,
    TResult Function(String teamId, String message)? messageAllMembers,
    TResult Function(String teamName, int page)? searchTeamByName,
    TResult Function(int page)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (getPopularTeams != null) {
      return getPopularTeams(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTeamsByUserIdEvent value)
        getTeamsByUserIdEvent,
    required TResult Function(GetTeamByIdEvent value) getTeamById,
    required TResult Function(GetTeamMembersEvent value) getTeamMembers,
    required TResult Function(GetTeamJoinRequestsEvent value)
        getTeamJoinRequests,
    required TResult Function(AcceptJoinRequestEvent value) acceptJoinRequest,
    required TResult Function(DeclineJoinRequestEvent value) declineJoinRequest,
    required TResult Function(KickMemberFromTeamEvent value) kickMemberFromTeam,
    required TResult Function(JoinTeamEvent value) joinTeam,
    required TResult Function(LeaveTeamEvent value) leaveTeam,
    required TResult Function(MessageAllMembersEvent value) messageAllMembers,
    required TResult Function(SearchTeamByNameEvent value) searchTeamByName,
    required TResult Function(GetPopularTeamsEvent value) getPopularTeams,
  }) {
    return getPopularTeams(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult? Function(GetTeamByIdEvent value)? getTeamById,
    TResult? Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult? Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult? Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult? Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult? Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult? Function(JoinTeamEvent value)? joinTeam,
    TResult? Function(LeaveTeamEvent value)? leaveTeam,
    TResult? Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult? Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult? Function(GetPopularTeamsEvent value)? getPopularTeams,
  }) {
    return getPopularTeams?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTeamsByUserIdEvent value)? getTeamsByUserIdEvent,
    TResult Function(GetTeamByIdEvent value)? getTeamById,
    TResult Function(GetTeamMembersEvent value)? getTeamMembers,
    TResult Function(GetTeamJoinRequestsEvent value)? getTeamJoinRequests,
    TResult Function(AcceptJoinRequestEvent value)? acceptJoinRequest,
    TResult Function(DeclineJoinRequestEvent value)? declineJoinRequest,
    TResult Function(KickMemberFromTeamEvent value)? kickMemberFromTeam,
    TResult Function(JoinTeamEvent value)? joinTeam,
    TResult Function(LeaveTeamEvent value)? leaveTeam,
    TResult Function(MessageAllMembersEvent value)? messageAllMembers,
    TResult Function(SearchTeamByNameEvent value)? searchTeamByName,
    TResult Function(GetPopularTeamsEvent value)? getPopularTeams,
    required TResult orElse(),
  }) {
    if (getPopularTeams != null) {
      return getPopularTeams(this);
    }
    return orElse();
  }
}

abstract class GetPopularTeamsEvent implements TeamEvent {
  const factory GetPopularTeamsEvent({final int page}) = _$GetPopularTeamsEvent;

  int get page;
  @JsonKey(ignore: true)
  _$$GetPopularTeamsEventCopyWith<_$GetPopularTeamsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
