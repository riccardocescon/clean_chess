import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class SearchUserByTerm extends UseCase<List<User>, SearchUsersByTermParams> {
  final UserRepository repository;

  SearchUserByTerm(this.repository);

  @override
  Future<Either<Failure, List<User>>> call(SearchUsersByTermParams params) =>
      repository.searchByTerm(
        params.term,
        params.friend,
      );
}

class SearchUsersByTermParams {
  final String term;
  final bool friend;

  SearchUsersByTermParams(this.term, this.friend);
}
