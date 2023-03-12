import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetUsersByTerm extends UseCase<List<User>, GetUsersByTermParams> {
  final UserRepository repository;

  GetUsersByTerm(this.repository);

  @override
  Future<Either<Failure, List<User>>> call(GetUsersByTermParams params) =>
      repository.getUsersByTerm(
        params.term,
        params.friend,
      );
}

class GetUsersByTermParams {
  final String term;
  final bool friend;

  GetUsersByTermParams(this.term, this.friend);
}
