import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/debug.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/core/utilities/mixins/access_token_provider.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/remote_game_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class LichessGameDataSource extends RemoteGameDataSource {
  final LichessTokenProvider _tokenProvider;

  LichessGameDataSource(this._tokenProvider);

  /// Download one game
  /// Ongoing games have their last 3 moves omitted, after move 5.
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
  }) async {
    try {
      logDebug(
        'Exporting game...',
        tag: 'Games',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.games.exportGame(
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

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Api call to get the user's games
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
  }) async {
    try {
      logDebug(
        'Exporting games of user...',
        tag: 'Games',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = client.games.exportGamesOfUser(
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
        clocks: clocks,
        evals: evals,
        accuracy: accuracy,
        opening: opening,
        ongoing: ongoing,
        finished: finished,
        literate: literate,
        lastFen: lastFen,
        players: players,
        sort: sort,
      );

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }
}
