import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/game_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class ExportGame extends UseCase<LichessGame, ExportGameParams> {
  final GameRepository repository;

  const ExportGame(this.repository);

  @override
  Future<Either<Failure, LichessGame>> call(ExportGameParams params) {
    return repository.exportGame(
      gameId: params.gameId,
      moves: params.moves,
      pgnInJson: params.pgnInJson,
      tags: params.tags,
      clocks: params.clocks,
      evals: params.evals,
      accuracy: params.accuracy,
      opening: params.opening,
      literate: params.literate,
      players: params.players,
    );
  }
}

class ExportGameParams {
  final String gameId;
  final bool moves;
  final bool pgnInJson;
  final bool tags;
  final bool clocks;
  final bool evals;
  final bool accuracy;
  final bool opening;
  final bool literate;
  final String? players;

  ExportGameParams({
    required this.gameId,
    this.moves = true,
    this.pgnInJson = false,
    this.tags = true,
    this.clocks = false,
    this.evals = true,
    this.accuracy = false,
    this.opening = false,
    this.literate = false,
    this.players,
  });
}
