import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/puzzle_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetPuzzleActivity extends UseCase<Stream<PuzzleActivity>, int?> {
  final PuzzleRepository repository;

  GetPuzzleActivity(this.repository);

  @override
  Future<Either<Failure, Stream<PuzzleActivity>>> call(int? params) async {
    return repository.getPuzzleActivity(max: params);
  }
}
