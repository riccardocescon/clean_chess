import 'package:clean_chess/chess/error/failures.dart';
import 'package:clean_chess/features/clean_chess/domain/entities/net_login_data.dart';
import 'package:dartz/dartz.dart';

abstract class NetRepository {
  Future<Either<Failure, Map<String, dynamic>>> login(
      String username, String password);
}
