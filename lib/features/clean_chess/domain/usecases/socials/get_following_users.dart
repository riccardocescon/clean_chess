import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/social_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetFollowingUsers extends UseCaseNoArgs<List<User>> {
  final SocialRepository repository;

  GetFollowingUsers(this.repository);

  @override
  Future<Either<Failure, List<User>>> call() => repository.getFollowingUsers();
}
