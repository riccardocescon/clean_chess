import 'package:cleanchess/chess/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class LichessRepository {
  Future<Either<Failure, String>> authenticate({
    required String codeVerifier,
    required String stateVerifier,
    required String clientId,
    required String redirectUri,
  });
}
