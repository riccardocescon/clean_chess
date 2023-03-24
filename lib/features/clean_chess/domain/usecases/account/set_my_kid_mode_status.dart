import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:cleanchess/features/clean_chess/data/repositories/lichess/lichess_account_repository.dart';
import 'package:dartz/dartz.dart';

class SetMyKidModeStatus extends UseCase<Empty, bool> {
  final LichessAccountRepository repository;

  SetMyKidModeStatus(this.repository);

  @override
  Future<Either<Failure, Empty>> call(bool params) async =>
      await repository.setMyKidModeStatus(params);
}
