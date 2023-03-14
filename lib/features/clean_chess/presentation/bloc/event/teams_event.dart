import 'package:cleanchess/features/clean_chess/presentation/bloc/server_event.dart';

abstract class TeamEvent implements ServerEvent {
  const TeamEvent();
}

class GetTeamsByUserIdEvent extends TeamEvent {
  final String userId;
  const GetTeamsByUserIdEvent({required this.userId});
}

class GetTeamByIdEvent extends TeamEvent {
  final String teamId;
  const GetTeamByIdEvent({required this.teamId});
}

class GetTeamMembersEvent extends TeamEvent {
  final String teamId;
  final int maxMembers;
  const GetTeamMembersEvent({required this.teamId, this.maxMembers = 100});
}

class GetTeamJoinRequestsEvent extends TeamEvent {
  final String teamId;
  const GetTeamJoinRequestsEvent({required this.teamId});
}

class AcceptJoinRequestEvent extends TeamEvent {
  final String teamId;
  final String userId;
  const AcceptJoinRequestEvent({required this.teamId, required this.userId});
}

class DeclineJoinRequestEvent extends TeamEvent {
  final String teamId;
  final String userId;
  const DeclineJoinRequestEvent({required this.teamId, required this.userId});
}

class KickMemberFromTeamEvent extends TeamEvent {
  final String teamId;
  final String userId;
  const KickMemberFromTeamEvent({required this.teamId, required this.userId});
}

class JoinTeamEvent extends TeamEvent {
  final String teamId;

  /// If the team requries a message, a [LichessOAuthFailure]
  /// will be thrown with error code 400, that may means that
  /// the team requires a message, so you can try again with
  /// a message with a minimum length of 30 characters.
  final String? message;
  final String? password;

  const JoinTeamEvent({required this.teamId, this.message, this.password});
}

class LeaveTeamEvent extends TeamEvent {
  final String teamId;
  const LeaveTeamEvent({required this.teamId});
}

class MessageAllMembersEvent extends TeamEvent {
  final String teamId;
  final String message;
  const MessageAllMembersEvent({
    required this.teamId,
    required this.message,
  });
}

class SearchTeamByNameEvent extends TeamEvent {
  final String teamName;
  final int page;
  const SearchTeamByNameEvent({required this.teamName, this.page = 1});
}

class GetPopularTeamsEvent extends TeamEvent {
  final int page;
  const GetPopularTeamsEvent({this.page = 1});
}
