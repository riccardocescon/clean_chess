import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/user_repository.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/server_event.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetChessVariantLeaderboard
    extends UseCase<List<User>, GetChessVariantLeaderboardParams> {
  final UserRepository userRepository;

  GetChessVariantLeaderboard(this.userRepository);

  @override
  Future<Either<Failure, List<User>>> call(
          GetChessVariantLeaderboardParams params) =>
      userRepository.getChessVariantLeaderboard(
        params.perfType,
        params.nb,
      );
}

class GetChessVariantLeaderboardParams {
  final PerfType perfType;
  final int nb;

  GetChessVariantLeaderboardParams(this.perfType, this.nb);
}
