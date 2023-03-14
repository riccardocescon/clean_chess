import 'package:cleanchess/chess/error/failures.dart';
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

class LichessError extends ServerState {
  final Failure failure;

  const LichessError(this.failure);
}
