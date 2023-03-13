import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetUsernamesByTerm
    extends UseCase<List<String>, GetUsernamesByTermParams> {
  final UserRepository userRepository;

  GetUsernamesByTerm(this.userRepository);

  @override
  Future<Either<Failure, List<String>>> call(GetUsernamesByTermParams params) =>
      userRepository.getUsernamesByTerm(
        params.term,
        params.friend,
      );
}

class GetUsernamesByTermParams {
  final String term;
  final bool friend;

  GetUsernamesByTermParams(this.term, this.friend);
}
