import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/puzzle_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetPuzzleDashboard extends UseCase<LichessPuzzleDashboard, int?> {
  final PuzzleRepository repository;

  GetPuzzleDashboard(this.repository);

  @override
  Future<Either<Failure, LichessPuzzleDashboard>> call(int? params) async {
    return repository.getPuzzleDashboard(days: params ?? 30);
  }
}
