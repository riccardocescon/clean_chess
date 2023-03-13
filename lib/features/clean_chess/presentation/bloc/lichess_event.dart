import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class LichessEvent {
  const LichessEvent();
}

class LichessOAuthEvent extends LichessEvent {
  const LichessOAuthEvent();
}

class GetMyProfileEvent extends LichessEvent {
  const GetMyProfileEvent();
}

class GetMyEmailEvent extends LichessEvent {
  const GetMyEmailEvent();
}

class GetMyKidModeStatusEvent extends LichessEvent {
  const GetMyKidModeStatusEvent();
}

class SetMyKidModeStatusEvent extends LichessEvent {
  final bool kidModeStatus;

  const SetMyKidModeStatusEvent(this.kidModeStatus);
}

class GetMyPreferencesEvent extends LichessEvent {
  const GetMyPreferencesEvent();
}

class GetTeamsByUserIdEvent extends LichessEvent {
  final String userId;
  const GetTeamsByUserIdEvent({required this.userId});
}

class GetTeamByIdEvent extends LichessEvent {
  final String teamId;
  const GetTeamByIdEvent({required this.teamId});
}

class GetTeamMembersEvent extends LichessEvent {
  final String teamId;
  final int maxMembers;
  const GetTeamMembersEvent({required this.teamId, this.maxMembers = 100});
}

class GetTeamJoinRequestsEvent extends LichessEvent {
  final String teamId;
  const GetTeamJoinRequestsEvent({required this.teamId});
}

class AcceptJoinRequestEvent extends LichessEvent {
  final String teamId;
  final String userId;
  const AcceptJoinRequestEvent({required this.teamId, required this.userId});
}

class DeclineJoinRequestEvent extends LichessEvent {
  final String teamId;
  final String userId;
  const DeclineJoinRequestEvent({required this.teamId, required this.userId});
}

class KickMemberFromTeamEvent extends LichessEvent {
  final String teamId;
  final String userId;
  const KickMemberFromTeamEvent({required this.teamId, required this.userId});
}

class JoinTeamEvent extends LichessEvent {
  final String teamId;

  /// If the team requries a message, a [LichessOAuthFailure]
  /// will be thrown with error code 400, that may means that
  /// the team requires a message, so you can try again with
  /// a message with a minimum length of 30 characters.
  final String? message;
  final String? password;

  const JoinTeamEvent({required this.teamId, this.message, this.password});
}

class LeaveTeamEvent extends LichessEvent {
  final String teamId;
  const LeaveTeamEvent({required this.teamId});
}

class MessageAllMembersEvent extends LichessEvent {
  final String teamId;
  final String message;
  const MessageAllMembersEvent({
    required this.teamId,
    required this.message,
  });
}

class SearchTeamByNameEvent extends LichessEvent {
  final String teamName;
  final int page;
  const SearchTeamByNameEvent({required this.teamName, this.page = 1});
}

class GetPopularTeamsEvent extends LichessEvent {
  final int page;
  const GetPopularTeamsEvent({this.page = 1});
}

class SearchUsersByTermEvent extends LichessEvent {
  final String term;
  final bool friend;
  const SearchUsersByTermEvent({required this.term, this.friend = false});
}

class SearchUsernamesByTermEvent extends LichessEvent {
  final String term;
  final bool friend;
  const SearchUsernamesByTermEvent({required this.term, this.friend = false});
}

class GetRealtimeStatusEvent extends LichessEvent {
  final List<String> ids;
  final bool withGameIds;
  const GetRealtimeStatusEvent({
    required this.ids,
    this.withGameIds = false,
  });
}

// Coming soon...
class GetTop10PlayersEvent extends LichessEvent {
  const GetTop10PlayersEvent();
}

// Coming soon...
class GetChessVariantLeaderboardEvent extends LichessEvent {
  final PerfType perfType;
  final int nb;
  const GetChessVariantLeaderboardEvent({
    required this.perfType,
    this.nb = 100,
  });
}

class GetPublicDataEvent extends LichessEvent {
  final String username;
  final bool trophies;
  const GetPublicDataEvent({
    required this.username,
    this.trophies = false,
  });
}

class GetRatingHistoryEvent extends LichessEvent {
  final String username;
  const GetRatingHistoryEvent({required this.username});
}
