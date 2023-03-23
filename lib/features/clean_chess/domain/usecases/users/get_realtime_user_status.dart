import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetRealtimeStatus
    extends UseCase<List<RealTimeUserStatus>, GetRealtimeStatusParams> {
  final UserRepository userRepository;

  GetRealtimeStatus(this.userRepository);

  @override
  Future<Either<Failure, List<RealTimeUserStatus>>> call(
    GetRealtimeStatusParams params,
  ) =>
      userRepository.getRealtimeStatus(
        params.ids,
        params.withGameIds,
      );
}

class GetRealtimeStatusParams {
  final List<String> ids;
  final bool withGameIds;

  GetRealtimeStatusParams(this.ids, this.withGameIds);
}
