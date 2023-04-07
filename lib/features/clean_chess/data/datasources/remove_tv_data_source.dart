import 'package:cleanchess/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class RemoteTvDataSource {
  Future<Either<Failure, List<LichessTvGameBasicInfo>>> getCurrentTvGames();
  Future<Either<Failure, Stream<LichessTvGameSummary>>> streamCurrentTvGame();
}

abstract class LocalTvDataSource {}
