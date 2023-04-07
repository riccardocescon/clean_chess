import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/data/repositories/lichess/lichess_repositories.dart';
import 'package:dartz/dartz.dart';

class LichessRevokeToken extends UseCase<void, String> {
  final LichessOAuthRepository repository;

  LichessRevokeToken(this.repository);

  @override
  Future<Either<Failure, void>> call(String params) async {
    return await repository.revokeToken(params);
  }
}
