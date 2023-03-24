import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetRatingHistory extends UseCase<List<RatingHistory>, String> {
  final UserRepository repository;

  GetRatingHistory(this.repository);

  @override
  Future<Either<Failure, List<RatingHistory>>> call(String params) =>
      repository.getRatingHistory(params);
}
