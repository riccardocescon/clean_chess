import 'package:cleanchess/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class RemoteTvDataSource {
  //TODO: api defition here, you may copu the one on the doc
  Future<Either<Failure, List<LichessTvGameBasicInfo>>> getCurrentTvGames();
}

// where this goes?
abstract class LocalTvDataSource {}
