import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class GetPublicData extends UseCase<User, GetPublicDataParams> {
  final UserRepository userRepository;

  GetPublicData(this.userRepository);

  @override
  Future<Either<Failure, User>> call(GetPublicDataParams params) =>
      userRepository.getPublicData(
        username: params.username,
        trophies: params.trophies,
      );
}

class GetPublicDataParams {
  final String username;
  final bool trophies;

  GetPublicDataParams(this.username, {this.trophies = false});
}
