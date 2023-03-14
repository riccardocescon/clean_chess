import 'package:cleanchess/features/clean_chess/presentation/bloc/server_event.dart';

abstract class OAuthEvent implements ServerEvent {
  const OAuthEvent();
}

class LichessOAuthEvent extends OAuthEvent {
  const LichessOAuthEvent();
}
