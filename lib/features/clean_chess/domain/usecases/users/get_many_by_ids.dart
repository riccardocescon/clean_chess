import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetManyByIds extends UseCase<List<User>, List<String>> {
  final UserRepository repository;

  GetManyByIds(this.repository);

  @override
  Future<Either<Failure, List<User>>> call(List<String> params) =>
      repository.getManyByIds(params);
}
