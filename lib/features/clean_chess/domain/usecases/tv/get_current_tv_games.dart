// UseCase is a blueprint class that you can find inside the core/domain/usecase pat

import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/tv_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetCurrentTvGames extends UseCaseNoArgs<List<LichessTvGameBasicInfo>> {
  final TvRepository _tvRepository;

  const GetCurrentTvGames(this._tvRepository);

  @override
  Future<Either<Failure, List<LichessTvGameBasicInfo>>> call() async {
    // Here we need to call the Upper sub-layer that is the Repository, so we should create it

    // Remember: usecase role is to validate and create the Model (rn the model is already created from the LichessApi, so we will skip that)
    return await _tvRepository.getCurrentTvGames();
  }
}
