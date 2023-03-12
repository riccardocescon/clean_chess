import 'package:cleanchess/chess/error/failures.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class LichessState {
  const LichessState();
}

class LichessInitial extends LichessState {}

class LichessLoading extends LichessState {}

class LichessLoaded<T> extends LichessState {
  final T data;

  const LichessLoaded(this.data);
}

class LichessOAuthSuccess extends LichessState {
  const LichessOAuthSuccess();
}

class LichessUserFetched extends LichessState {
  final User user;

  const LichessUserFetched(this.user);
}

class LichessError extends LichessState {
  final Failure failure;

  const LichessError(this.failure);
}
