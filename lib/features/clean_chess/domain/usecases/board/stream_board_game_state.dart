import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/board_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class StreamBoardGameState
    extends UseCase<Stream<LichessBoardGameEvent>, String> {
  final BoardRepository repository;

  StreamBoardGameState(this.repository);

  @override
  Future<Either<Failure, Stream<LichessBoardGameEvent>>> call(
    String params,
  ) {
    return repository.streamGameState(params);
  }
}
