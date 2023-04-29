import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/remote_game_data_source.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/game_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client/src/models/user.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class LichessGameRepository implements GameRepository {
  final RemoteGameDataSource remoteGameDataSource;

  LichessGameRepository(this.remoteGameDataSource);

  @override
  Future<Either<Failure, LichessGame>> exportGame({
    required String gameId,
    bool moves = true,
    bool pgnInJson = false,
    bool tags = true,
    bool clocks = false,
    bool evals = true,
    bool accuracy = false,
    bool opening = false,
    bool literate = false,
    String? players,
  }) {
    return remoteGameDataSource.exportGame(
      gameId: gameId,
      moves: moves,
      pgnInJson: pgnInJson,
      tags: tags,
      clocks: clocks,
      evals: evals,
      accuracy: accuracy,
      opening: opening,
      literate: literate,
      players: players,
    );
  }

  @override
  Future<Either<Failure, Stream<LichessGame>>> exportGamesOfUser({
    required String username,
    DateTime? since,
    DateTime? until,
    int? max,
    String? vs,
    bool? rated,
    List<PerfType>? perfTypes,
    LichessColor? color,
    bool? analysed,
    bool moves = true,
    bool pgnInJson = false,
    bool tags = true,
    bool clocks = false,
    bool evals = true,
    bool accuracy = false,
    bool opening = false,
    bool ongoing = false,
    bool finished = true,
    bool literate = false,
    bool lastFen = false,
    String? players,
    LichessGameSort? sort,
  }) {
    return remoteGameDataSource.exportGamesOfUser(
      username: username,
      since: since,
      until: until,
      max: max,
      vs: vs,
      rated: rated,
      perfTypes: perfTypes,
      color: color,
      analysed: analysed,
      moves: moves,
      pgnInJson: pgnInJson,
      tags: tags,
      accuracy: accuracy,
      clocks: clocks,
      evals: evals,
      opening: opening,
      ongoing: ongoing,
      finished: finished,
      literate: literate,
      lastFen: lastFen,
      players: players,
      sort: sort,
    );
  }
}
