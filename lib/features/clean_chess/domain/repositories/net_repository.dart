import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/features/clean_chess/domain/entities/net_login_data.dart';
import 'package:dartz/dartz.dart';

abstract class NetRepository {
  Future<Either<Failure, Map<String, dynamic>>> login(
      String username, String password);
}
