import 'package:cleanchess/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class RemotePuzzleDataSource {
  /// Get the current daily Puzzle
  Future<Either<Failure, LichessPuzzle>> getDailyPuzzle();

  /// Get a Puzzle by its ID
  Future<Either<Failure, LichessPuzzle>> getPuzzleById(String id);

  /// Get Puzzle Activity
  Future<Either<Failure, Stream<LichessPuzzleActivity>>> getPuzzleActivity(
      {int? max});

  /// Get Puzzle Dashboard
  Future<Either<Failure, LichessPuzzleDashboard>> getPuzzleDashboard(
      {int days = 30});
}
