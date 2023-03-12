import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/data/repositories/lichess/lichess_account_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetMyProfile extends UseCase<User, NoParams> {
  final LichessAccountRepository repository;

  GetMyProfile(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async =>
      repository.getUserProfile();
}
