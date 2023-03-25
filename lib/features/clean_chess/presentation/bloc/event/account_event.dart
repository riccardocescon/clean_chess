import 'package:cleanchess/features/clean_chess/presentation/bloc/server_event.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_event.freezed.dart';

@freezed
abstract class AccountEvent with _$AccountEvent implements ServerEvent {
  const factory AccountEvent.getMyProfile() = GetMyProfileEvent;

  const factory AccountEvent.getMyEmail() = GetMyEmailEvent;

  const factory AccountEvent.getMyKidModeStatus() = GetMyKidModeStatusEvent;

  const factory AccountEvent.setMyKidModeStatus(bool kidModeStatus) =
      SetMyKidModeStatusEvent;

  const factory AccountEvent.getMyPreferences() = GetMyPreferencesEvent;
}
