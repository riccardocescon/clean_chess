import 'package:cleanchess/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class RemotePuzzleDataSource {
  /// Get the current daily Puzzle
  Future<Either<Failure, Puzzle>> getDailyPuzzle();

  /// Get a Puzzle by its ID
  Future<Either<Failure, Puzzle>> getPuzzleById(String id);

  /// Get Puzzle Activity
  Future<Either<Failure, Stream<PuzzleActivity>>> getPuzzleActivity({int? max});

  /// Get Puzzle Dashboard
  Future<Either<Failure, PuzzleDashboard>> getPuzzleDashboard({int days = 30});
}
