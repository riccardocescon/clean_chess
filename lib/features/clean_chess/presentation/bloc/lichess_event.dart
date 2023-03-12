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
  const GetTeamMembersEvent({required this.teamId});
}

class GetTeamJoinRequestsEvent extends LichessEvent {
  final String teamId;
  const GetTeamJoinRequestsEvent({required this.teamId});
}
