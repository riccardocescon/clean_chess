import 'package:cleanchess/features/clean_chess/presentation/bloc/server_event.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class UserEvent implements ServerEvent {
  const UserEvent();
}

class SearchUsersByTermEvent extends UserEvent {
  final String term;
  final bool friend;
  const SearchUsersByTermEvent({required this.term, this.friend = false});
}

class SearchUsernamesByTermEvent extends UserEvent {
  final String term;
  final bool friend;
  const SearchUsernamesByTermEvent({required this.term, this.friend = false});
}

class GetRealtimeStatusEvent extends UserEvent {
  final List<String> ids;
  final bool withGameIds;
  const GetRealtimeStatusEvent({
    required this.ids,
    this.withGameIds = false,
  });
}

// Coming soon...
class GetTop10PlayersEvent extends UserEvent {
  const GetTop10PlayersEvent();
}

// Coming soon...
class GetChessVariantLeaderboardEvent extends UserEvent {
  final PerfType perfType;
  final int nb;
  const GetChessVariantLeaderboardEvent({
    required this.perfType,
    this.nb = 100,
  });
}

class GetPublicDataEvent extends UserEvent {
  final String username;
  final bool trophies;
  const GetPublicDataEvent({
    required this.username,
    this.trophies = false,
  });
}

class GetRatingHistoryEvent extends UserEvent {
  final String username;
  const GetRatingHistoryEvent({required this.username});
}

class GetManyByIdsEvent extends UserEvent {
  final List<String> ids;
  const GetManyByIdsEvent({required this.ids});
}

class GetLiveStreamersEvent extends UserEvent {
  const GetLiveStreamersEvent();
}
