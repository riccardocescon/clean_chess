// UseCase is a blueprint class that you can find inside the core/domain/usecase pat

import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/tv_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetCurrentTvGames extends UseCaseNoArgs<Stream<LichessTvGameSummary>> {
  final TvRepository _tvRepository;

  const GetCurrentTvGames(this._tvRepository);

  @override
  Future<Either<Failure, Stream<LichessTvGameSummary>>> call() async {
    return await _tvRepository.streamCurrentTvGame();
  }
}
