import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/lichess_repositoy.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetMyProfile extends UseCase<User, NoParams> {
  final LichessRepository repository;

  GetMyProfile(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async =>
      repository.getUserProfile();
}
