import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class RemoteAccountDataSource {
  /// API request to get user profile
  Future<Either<Failure, User>> getMyUserProfile();

  /// API request to get user email
  /// This is a separate API call because the email is not returned
  /// in the user profile API call
  Future<Either<Failure, String>> getMyUserEmail();

  /// API request to get user kid mode status
  /// This is a separate API call because the kid mode status is not returned
  /// in the user profile API call
  Future<Either<Failure, bool>> getMyKidModeStatus();

  /// API request to set user kid mode status
  Future<Either<Failure, Empty>> setMyKidModeStatus({required bool status});

  /// API request to get user preferences
  /// This is a separate API call because the preferences are not returned
  /// in the user profile API call
  Future<Either<Failure, UserPreferences>> getMyPreferences();
}
