import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/remote_puzzle_data_source.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/puzzle_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class LichessPuzzleRepository implements PuzzleRepository {
  final RemotePuzzleDataSource remotePuzzleDataSource;

  LichessPuzzleRepository(this.remotePuzzleDataSource);

  @override
  Future<Either<Failure, Puzzle>> getDailyPuzzle() async {
    return remotePuzzleDataSource.getDailyPuzzle();
  }

  @override
  Future<Either<Failure, Puzzle>> getPuzzleById(String id) async {
    return remotePuzzleDataSource.getPuzzleById(id);
  }

  @override
  Future<Either<Failure, Stream<PuzzleActivity>>> getPuzzleActivity({
    int? max,
  }) async {
    return remotePuzzleDataSource.getPuzzleActivity(max: max);
  }

  @override
  Future<Either<Failure, PuzzleDashboard>> getPuzzleDashboard({
    int days = 30,
  }) async {
    return remotePuzzleDataSource.getPuzzleDashboard(days: days);
  }
}
