import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/team_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetPopularTeams extends UseCase<PageOf<Team>, int> {
  final TeamRepository repository;

  GetPopularTeams(this.repository);

  @override
  Future<Either<Failure, PageOf<Team>>> call(int params) =>
      repository.getPopularTeams(params);
}
