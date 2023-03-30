import 'package:cleanchess/features/clean_chess/presentation/bloc/server_event.dart';

class GetStreamingGames extends ServerEvent {
  const GetStreamingGames();
}

class StreamCurrentTvGamesEvent extends ServerEvent {
  const StreamCurrentTvGamesEvent();
}
