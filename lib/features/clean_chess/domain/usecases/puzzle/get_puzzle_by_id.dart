import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/puzzle_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetPuzzleById extends UseCase<LichessPuzzle, String> {
  final PuzzleRepository repository;

  GetPuzzleById(this.repository);

  @override
  Future<Either<Failure, LichessPuzzle>> call(String params) async {
    return repository.getPuzzleById(params);
  }
}
