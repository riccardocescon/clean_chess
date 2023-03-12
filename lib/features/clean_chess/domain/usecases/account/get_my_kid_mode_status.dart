import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/lichess_repositoy.dart';
import 'package:dartz/dartz.dart';

class GetMyKidModeStatus extends UseCase<bool, NoParams> {
  final LichessRepository repository;

  GetMyKidModeStatus(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.getMyKidModeStatus();
  }
}
