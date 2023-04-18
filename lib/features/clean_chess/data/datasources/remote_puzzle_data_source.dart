import 'package:cleanchess/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class RemotePuzzleDataSource {
  /// Get the current daily LichessPuzzle
  Future<Either<Failure, LichessPuzzle>> getDailyPuzzle();

  /// Get a LichessPuzzle by its ID
  Future<Either<Failure, LichessPuzzle>> getPuzzleById(String id);

  /// Get LichessPuzzle Activity
  Future<Either<Failure, Stream<LichessPuzzleActivity>>> getPuzzleActivity(
      {int? max});

  /// Get LichessPuzzle Dashboard
  Future<Either<Failure, LichessPuzzleDashboard>> getPuzzleDashboard(
      {int days = 30});
}
