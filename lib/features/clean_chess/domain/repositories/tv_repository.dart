import 'package:cleanchess/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

// perfect, lets continue then

// and then on the top layer Data we can create multiple Groups, such as lichess, chesscom
// and give them a custom implementation
abstract class TvRepository {
  const TvRepository();

  Future<Either<Failure, List<LichessTvGameBasicInfo>>> getCurrentTvGames();
  Future<Either<Failure, Stream<LichessTvGameSummary>>> streamCurrentTvGame();
}
