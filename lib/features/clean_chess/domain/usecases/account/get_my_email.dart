import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/data/repositories/lichess/lichess_account_repository.dart';
import 'package:dartz/dartz.dart';

class GetMyEmail extends UseCase<String, NoParams> {
  final LichessAccountRepository repository;

  GetMyEmail(this.repository);

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await repository.getMyEmail();
  }
}
