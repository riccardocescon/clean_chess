import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/board_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class StreamIncomingEvents
    extends UseCaseNoArgs<Stream<LichessBoardGameIncomingEvent>> {
  final BoardRepository repository;

  StreamIncomingEvents(this.repository);

  @override
  Future<Either<Failure, Stream<LichessBoardGameIncomingEvent>>> call() {
    return repository.streamIncomingEvents();
  }
}
