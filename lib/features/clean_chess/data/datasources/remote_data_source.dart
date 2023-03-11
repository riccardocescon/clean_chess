import 'package:cleanchess/chess/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, Map<String, dynamic>>> login(
    String username,
    String password,
  );
}
