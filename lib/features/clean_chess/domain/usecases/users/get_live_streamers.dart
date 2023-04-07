import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetLiveStreamers extends UseCaseNoArgs<List<User>> {
  final UserRepository repository;

  GetLiveStreamers(this.repository);

  @override
  Future<Either<Failure, List<User>>> call() async {
    return await repository.getLiveStreamers();
  }
}
