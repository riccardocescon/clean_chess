import 'package:cleanchess/features/clean_chess/presentation/bloc/server_event.dart';

abstract class AccountEvent implements ServerEvent {
  const AccountEvent();
}

class GetMyProfileEvent extends AccountEvent {
  const GetMyProfileEvent();
}

class GetMyEmailEvent extends AccountEvent {
  const GetMyEmailEvent();
}

class GetMyKidModeStatusEvent extends AccountEvent {
  const GetMyKidModeStatusEvent();
}

class SetMyKidModeStatusEvent extends AccountEvent {
  final bool kidModeStatus;

  const SetMyKidModeStatusEvent(this.kidModeStatus);
}

class GetMyPreferencesEvent extends AccountEvent {
  const GetMyPreferencesEvent();
}
