import 'package:cleanchess/core/errors/failure.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class ServerState {
  const ServerState();
}

class LichessInitial extends ServerState {}

class LichessLoading extends ServerState {}

class LichessLoaded<T> extends ServerState {
  final T data;

  const LichessLoaded(this.data);
}

class LichessOAuthSuccess extends ServerState {
  const LichessOAuthSuccess();
}

class LichessUserFetched extends ServerState {
  final User user;

  const LichessUserFetched(this.user);
}

class LichessRealTimeStatsFetched extends ServerState {
  final List<RealTimeUserStatus> realTimeStats;

  const LichessRealTimeStatsFetched(this.realTimeStats);
}

class LichessFollowingUsersFetched extends ServerState {
  final List<User> followingUsers;

  const LichessFollowingUsersFetched(this.followingUsers);
}

class LichessTokenRevoked extends ServerState {
  const LichessTokenRevoked();
}

class LichessStreamingGamesFetched extends ServerState {
  const LichessStreamingGamesFetched();
}

class LichessError extends ServerState {
  final Failure failure;

  const LichessError(this.failure);
}
