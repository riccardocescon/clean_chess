import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetLiveStreamers extends UseCase<List<User>, NoParams> {
  final UserRepository repository;

  GetLiveStreamers(this.repository);

  @override
  Future<Either<Failure, List<User>>> call(NoParams params) async {
    return await repository.getLiveStreamers();
  }
}
