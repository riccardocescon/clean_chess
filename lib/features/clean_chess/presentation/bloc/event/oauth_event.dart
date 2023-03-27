import 'package:cleanchess/features/clean_chess/presentation/bloc/server_event.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'oauth_event.freezed.dart';

@freezed
abstract class OAuthEvent with _$OAuthEvent implements ServerEvent {
  const factory OAuthEvent.lichessOAuth() = LichessOAuthEvent;
  const factory OAuthEvent.revokeToken() = LichessRevokeTokenEvent;
}
