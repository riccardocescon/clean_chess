import 'package:clean_chess/chess/error/failures.dart';
import 'package:clean_chess/features/clean_chess/data/datasources/remote_data_source.dart';
import 'package:dartz/dartz.dart';

/// This class is responsible for making API calls to Lichess
/// and returning the response to the [NetRepositoryImpl]
///
/// This class is not resposible for any business logic
class LichessDataSource extends RemoteDataSource {
  @override
  Future<Either<Failure, Map<String, dynamic>>> login(
    String username,
    String password,
  ) {
    //TODO : API call
    throw UnimplementedError();
  }
}
