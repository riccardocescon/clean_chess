import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/core/utilities/globals.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/board_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class CreateRealTimeSeek extends UseCase<Keepalive, CreateRealTimeSeekParams> {
  final BoardRepository _boardRepository;

  CreateRealTimeSeek(this._boardRepository);

  @override
  Future<Either<Failure, Keepalive>> call(CreateRealTimeSeekParams params) {
    return _boardRepository.createRealTimeSeek(
      time: params.time,
      increment: params.increment,
      days: params.days,
      rated: params.rated,
      variant: params.variant,
      color: params.color,
      maxRating: params.maxRating,
      minRating: params.minRating,
    );
  }
}

class CreateRealTimeSeekParams {
  final double time;
  final int increment;
  final DaysPerTurn? days;
  final bool rated;
  final LichessVariantKey variant;
  final LichessChallengeColor color;
  final int? maxRating;
  final int? minRating;

  CreateRealTimeSeekParams({
    required this.time,
    required this.increment,
    this.days,
    this.rated = false,
    this.variant = LichessVariantKey.standard,
    this.color = LichessChallengeColor.random,
    this.maxRating,
    this.minRating,
  });
}
