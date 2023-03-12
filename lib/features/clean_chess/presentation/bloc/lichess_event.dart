abstract class LichessEvent {
  const LichessEvent();
}

class LichessOAuthEvent extends LichessEvent {
  const LichessOAuthEvent();
}

class GetMyProfileEvent extends LichessEvent {
  const GetMyProfileEvent();
}
