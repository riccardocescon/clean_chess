import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/game_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class ExportGamesOfUser
    extends UseCase<Stream<LichessGame>, ExportGamesOfUserParams> {
  final GameRepository repository;

  const ExportGamesOfUser(this.repository);

  @override
  Future<Either<Failure, Stream<LichessGame>>> call(
      ExportGamesOfUserParams params) {
    return repository.exportGamesOfUser(
      username: params.username,
      since: params.since,
      until: params.until,
      max: params.max,
      vs: params.vs,
      rated: params.rated,
      perfTypes: params.perfTypes,
      color: params.color,
      analysed: params.analysed,
      moves: params.moves,
      pgnInJson: params.pgnInJson,
      tags: params.tags,
      clocks: params.clocks,
      evals: params.evals,
      accuracy: params.accuracy,
      opening: params.opening,
      ongoing: params.ongoing,
      finished: params.finished,
      literate: params.literate,
      lastFen: params.lastFen,
      players: params.players,
      sort: params.sort,
    );
  }
}

class ExportGamesOfUserParams {
  String username;
  DateTime? since;
  DateTime? until;
  int? max;
  String? vs;
  bool? rated;
  List<PerfType>? perfTypes;
  LichessColor? color;
  bool? analysed;
  bool moves;
  bool pgnInJson;
  bool tags;
  bool clocks;
  bool evals;
  bool accuracy;
  bool opening;
  bool ongoing;
  bool finished;
  bool literate;
  bool lastFen;
  String? players;
  LichessGameSort? sort;

  ExportGamesOfUserParams({
    required this.username,
    this.since,
    this.until,
    this.max,
    this.vs,
    this.rated,
    this.perfTypes,
    this.color,
    this.analysed,
    this.moves = true,
    this.pgnInJson = false,
    this.tags = true,
    this.clocks = false,
    this.evals = true,
    this.accuracy = false,
    this.opening = false,
    this.ongoing = false,
    this.finished = true,
    this.literate = false,
    this.lastFen = false,
    this.players,
    this.sort,
  });
}
