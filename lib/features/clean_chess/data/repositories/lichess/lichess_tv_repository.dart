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
    return await _lichessTvDataSource.getCurrentTvGames();
  }

  @override
  Future<Either<Failure, Stream<LichessTvGameSummary>>> streamCurrentTvGame() {
    return _lichessTvDataSource.streamCurrentTvGame();
  }
}
