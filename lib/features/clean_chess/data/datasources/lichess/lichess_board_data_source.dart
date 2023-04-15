import 'package:cleanchess/core/utilities/debug.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/core/utilities/globals.dart';
import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/mixins/access_token_provider.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/remote_board_data_source.dart';
import 'package:lichess_client/src/models/board.dart';
import 'package:dartz/dartz.dart';

class LichessBoardDataSource extends RemoteBoardDataSource {
  final LichessTokenProvider _tokenProvider;

  LichessBoardDataSource(this._tokenProvider);

  @override
  Future<Either<Failure, Keepalive>> createRealTimeSeek({
    required double time,
    required int increment,
    DaysPerTurn? days,
    bool rated = false,
    LichessVariantKey variant = LichessVariantKey.standard,
    LichessChallengeColor color = LichessChallengeColor.random,
    int? maxRating,
    int? minRating,
  }) async {
    try {
      logDebug(
        'Creating a RealTime Seek...',
        tag: 'Board',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.board.createRealTimeSeek(
        time: time,
        increment: increment,
        days: days,
        rated: rated,
        variant: variant,
        color: color,
        maxRating: maxRating,
        minRating: minRating,
      );

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Keepalive>> createCorrespondenceSeek({
    required DaysPerTurn days,
    bool rated = false,
    LichessVariantKey variant = LichessVariantKey.standard,
    LichessChallengeColor color = LichessChallengeColor.random,
    double? time,
    int? increment,
    int? maxRating,
    int? minRating,
  }) async {
    try {
      logDebug(
        'Creating a RealTime Game...',
        tag: 'Board',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.board.createCorrespondenceSeek(
        time: time,
        increment: increment,
        days: days,
        rated: rated,
        variant: variant,
        color: color,
        maxRating: maxRating,
        minRating: minRating,
      );

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Empty>> abortGame(String gameId) async {
    try {
      logDebug(
        'Aborting Game...',
        tag: 'Board',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      await client.board.abortGame(gameId);

      return const Right(Empty());
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Empty>> claimVictory(String gameId) async {
    try {
      logDebug(
        'Claiming Victory...',
        tag: 'Board',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      await client.board.claimVictory(gameId);

      return const Right(Empty());
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Stream<LichessGameChatMessage>>> fetchGameChat(
    String gameId,
  ) async {
    try {
      logDebug(
        'Fetching Game Chat...',
        tag: 'Board',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = client.board.fetchGameChat(gameId);

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }
}
