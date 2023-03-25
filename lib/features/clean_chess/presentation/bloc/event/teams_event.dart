import 'package:cleanchess/features/clean_chess/presentation/bloc/server_event.dart';
import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'teams_event.freezed.dart';

@freezed
abstract class TeamEvent with _$TeamEvent implements ServerEvent {
  const factory TeamEvent.getTeamsByUserIdEvent({
    required String userId,
  }) = GetTeamsByUserIdEvent;

  const factory TeamEvent.getTeamById({
    required String teamId,
  }) = GetTeamByIdEvent;

  const factory TeamEvent.getTeamMembers({
    required String teamId,
    @Default(100) int maxMembers,
  }) = GetTeamMembersEvent;

  const factory TeamEvent.getTeamJoinRequests({
    required String teamId,
  }) = GetTeamJoinRequestsEvent;

  const factory TeamEvent.acceptJoinRequest({
    required String teamId,
    required String userId,
  }) = AcceptJoinRequestEvent;

  const factory TeamEvent.declineJoinRequest({
    required String teamId,
    required String userId,
  }) = DeclineJoinRequestEvent;

  const factory TeamEvent.kickMemberFromTeam({
    required String teamId,
    required String userId,
  }) = KickMemberFromTeamEvent;

  const factory TeamEvent.joinTeam({
    required String teamId,

    /// If the team requries a message, a [LichessOAuthFailure]
    /// will be thrown with error code 400, that may means that
    /// the team requires a message, so you can try again with
    /// a message with a minimum length of 30 characters.
    String? message,
    String? password,
  }) = JoinTeamEvent;

  const factory TeamEvent.leaveTeam({
    required String teamId,
  }) = LeaveTeamEvent;

  const factory TeamEvent.messageAllMembers({
    required String teamId,
    required String message,
  }) = MessageAllMembersEvent;

  const factory TeamEvent.searchTeamByName({
    required String teamName,
    @Default(1) int page,
  }) = SearchTeamByNameEvent;

  const factory TeamEvent.getPopularTeams({
    @Default(1) int page,
  }) = GetPopularTeamsEvent;
}
