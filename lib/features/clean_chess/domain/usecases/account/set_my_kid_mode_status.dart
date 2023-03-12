import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/chess/utilities/utils.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/lichess_repositoy.dart';
import 'package:dartz/dartz.dart';

class SetMyKidModeStatus extends UseCase<Empty, bool> {
  final LichessRepository repository;

  SetMyKidModeStatus(this.repository);

  @override
  Future<Either<Failure, Empty>> call(bool params) async =>
      await repository.setMyKidModeStatus(params);
}
