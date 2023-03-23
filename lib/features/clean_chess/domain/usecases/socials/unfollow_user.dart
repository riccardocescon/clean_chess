import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/social_repository.dart';
import 'package:dartz/dartz.dart';

class UnfollowUser extends UseCase<bool, String> {
  final SocialRepository repository;

  UnfollowUser(this.repository);

  @override
  Future<Either<Failure, bool>> call(String params) =>
      repository.unfollowUser(params);
}
