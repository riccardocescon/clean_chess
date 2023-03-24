import 'package:cleanchess/core/utilities/empty.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/lichess/lichess_account_data_source.dart';
import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/account_repositoy.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

/// This class is responsible for making API calls to the interested DataSource
/// and returning the response to the [LichessAccountRepository]
///
/// This class is not resposible for any business logic
class LichessAccountRepository implements AccountRepository {
  final LichessAccountDataSource _accountDataSource;

  const LichessAccountRepository({
    required LichessAccountDataSource remoteDataSource,
  }) : _accountDataSource = remoteDataSource;

  @override
  Future<Either<Failure, User>> getUserProfile() =>
      _accountDataSource.getMyUserProfile();

  @override
  Future<Either<Failure, String>> getMyEmail() =>
      _accountDataSource.getMyUserEmail();

  @override
  Future<Either<Failure, bool>> getMyKidModeStatus() =>
      _accountDataSource.getMyKidModeStatus();

  @override
  Future<Either<Failure, Empty>> setMyKidModeStatus(bool status) =>
      _accountDataSource.setMyKidModeStatus(status: status);

  @override
  Future<Either<Failure, UserPreferences>> getMyPreferences() =>
      _accountDataSource.getMyPreferences();
}
