import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/core/utilities/globals.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/board_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class CreateCorrespondenceSeek
    extends UseCase<Keepalive, CreateCorrespondenceSeekParams> {
  final BoardRepository _boardRepository;

  CreateCorrespondenceSeek(this._boardRepository);

  @override
  Future<Either<Failure, Keepalive>> call(
      CreateCorrespondenceSeekParams params) {
    return _boardRepository.createCorrespondenceSeek(
      days: params.days,
      rated: params.rated,
      variant: params.variant,
      color: params.color,
      time: params.time,
      increment: params.increment,
      maxRating: params.maxRating,
      minRating: params.minRating,
    );
  }
}

class CreateCorrespondenceSeekParams {
  final DaysPerTurn days;
  final bool rated;
  final LichessVariantKey variant;
  final LichessChallengeColor color;
  final double? time;
  final int? increment;
  final int? maxRating;
  final int? minRating;

  CreateCorrespondenceSeekParams({
    required this.days,
    this.rated = false,
    this.variant = LichessVariantKey.standard,
    this.color = LichessChallengeColor.random,
    this.time,
    this.increment,
    this.maxRating,
    this.minRating,
  });
}
