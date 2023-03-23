import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class AccountRepository {
  Future<Either<Failure, User>> getUserProfile();

  Future<Either<Failure, String>> getMyEmail();

  Future<Either<Failure, bool>> getMyKidModeStatus();

  Future<Either<Failure, Empty>> setMyKidModeStatus(bool status);

  Future<Either<Failure, UserPreferences>> getMyPreferences();
}
