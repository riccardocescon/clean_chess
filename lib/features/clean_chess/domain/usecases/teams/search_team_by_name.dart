import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/team_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class SearchTeamByName extends UseCase<PageOf<Team>, SearchTeamByNameParams> {
  final TeamRepository repository;

  SearchTeamByName(this.repository);

  @override
  Future<Either<Failure, PageOf<Team>>> call(SearchTeamByNameParams params) =>
      repository.searchTeamByName(
        params.teamName,
        params.page,
      );
}

class SearchTeamByNameParams {
  final String teamName;
  final int page;

  SearchTeamByNameParams(this.teamName, this.page);
}
