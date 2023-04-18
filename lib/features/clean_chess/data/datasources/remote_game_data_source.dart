import 'package:cleanchess/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class RemoteGameDataSource {
  /// Download one game
  /// Ongoing games have their last 3 moves omitted, after move 5.
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
  });

  /// Download games of a user
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
  });
}
