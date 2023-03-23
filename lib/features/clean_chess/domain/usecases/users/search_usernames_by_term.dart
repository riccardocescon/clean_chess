import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class SearchUsernamesByTerm
    extends UseCase<List<String>, SearchUsernamesByTermParams> {
  final UserRepository userRepository;

  SearchUsernamesByTerm(this.userRepository);

  @override
  Future<Either<Failure, List<String>>> call(
          SearchUsernamesByTermParams params) =>
      userRepository.searchNamesByTerm(
        params.term,
        params.friend,
      );
}

class SearchUsernamesByTermParams {
  final String term;
  final bool friend;

  SearchUsernamesByTermParams(this.term, this.friend);
}
