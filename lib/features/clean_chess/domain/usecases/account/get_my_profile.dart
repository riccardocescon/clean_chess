import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/data/repositories/lichess/lichess_account_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetMyProfile extends UseCaseNoArgs<User> {
  final LichessAccountRepository repository;

  const GetMyProfile(this.repository);

  @override
  Future<Either<Failure, User>> call() async => repository.getUserProfile();
}
