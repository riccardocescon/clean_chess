import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/debug.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/core/utilities/mixins/access_token_provider.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/remote_puzzle_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class LichessPuzzleDataSource implements RemotePuzzleDataSource {
  final LichessTokenProvider _tokenProvider;

  const LichessPuzzleDataSource(this._tokenProvider);

  /// Api call to get the current daily LichessPuzzle
  @override
  Future<Either<Failure, LichessPuzzle>> getDailyPuzzle() async {
    try {
      logDebug(
        'Getting daily puzzle...',
        tag: 'LichessPuzzle',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.puzzles.getDailyPuzzle();

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Api call to get a LichessPuzzle by its ID
  @override
  Future<Either<Failure, LichessPuzzle>> getPuzzleById(String id) async {
    try {
      logDebug(
        'Getting puzzle by ID...',
        tag: 'LichessPuzzle',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.puzzles.getPuzzleById(id: id);

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Api call to get LichessPuzzle Activity
  @override
  Future<Either<Failure, Stream<LichessPuzzleActivity>>> getPuzzleActivity(
      {int? max}) async {
    try {
      logDebug(
        'Getting puzzle activity...',
        tag: 'LichessPuzzle',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = client.puzzles.getPuzzleActivity(max: max);

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// Api call to get LichessPuzzle Activity
  @override
  Future<Either<Failure, LichessPuzzleDashboard>> getPuzzleDashboard({
    int days = 30,
  }) async {
    try {
      logDebug(
        'Getting puzzle dashboard by user...',
        tag: 'LichessPuzzle',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      final response = await client.puzzles.getPuzzleDashboard(days: days);

      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }
}
