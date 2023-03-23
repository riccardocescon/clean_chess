import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/data/repositories/lichess/lichess_account_repository.dart';
import 'package:dartz/dartz.dart';

class GetMyKidModeStatus extends UseCase<bool, NoParams> {
  final LichessAccountRepository repository;

  GetMyKidModeStatus(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.getMyKidModeStatus();
  }
}
