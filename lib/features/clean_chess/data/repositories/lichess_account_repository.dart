import 'package:cleanchess/chess/utilities/utils.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/lichess/lichess_account_data_source.dart';
import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/account_repositoy.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

/// This class is responsible for making API calls to the interested DataSource
/// and returning the response to the [LichessAccountRepository]
///
/// This class is not resposible for any business logic
class LichessAccountRepository implements AccountRepository {
  final LichessAccountDataSource remoteDataSource;

  const LichessAccountRepository({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> getUserProfile() =>
      remoteDataSource.getMyUserProfile();

  @override
  Future<Either<Failure, String>> getMyEmail() =>
      remoteDataSource.getMyUserEmail();

  @override
  Future<Either<Failure, bool>> getMyKidModeStatus() =>
      remoteDataSource.getMyKidModeStatus();

  @override
  Future<Either<Failure, Empty>> setMyKidModeStatus(bool status) =>
      remoteDataSource.setMyKidModeStatus(status: status);

  @override
  Future<Either<Failure, UserPreferences>> getMyPreferences() =>
      remoteDataSource.getMyPreferences();
}
