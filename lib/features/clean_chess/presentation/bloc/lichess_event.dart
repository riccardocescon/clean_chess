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
