import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/lichess/lichess_tv_data_source.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/tv_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class LichessTvRepository extends TvRepository {
  final LichessTvDataSource _lichessTvDataSource;

  const LichessTvRepository(this._lichessTvDataSource);

  @override
  Future<Either<Failure, List<LichessTvGameBasicInfo>>>
      getCurrentTvGames() async {
    // Here a good thing we can do is to check if the internet connection is present
    // but we will do this in future, so we just skip that check and go to the datasource call

    // makes sense, then ok, usecase i will link to the user actor, basically, everything going up-to-down -> usecase validates

    // yes you guessed it right!
    // no, remember: the usecase takes the request and it forward that, but when it will
    // get the response it will analyze that and validate and make the model
    return await _lichessTvDataSource.getCurrentTvGames();
  }

  @override
  Future<Either<Failure, Stream<LichessTvGameSummary>>> streamCurrentTvGame() {
    return _lichessTvDataSource.streamCurrentTvGame();
  }
}
