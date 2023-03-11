import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/lichess_repositoy.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client/models.dart' as lichess;

class GetMyProfile extends UseCase<lichess.User, NoParams> {
  final LichessRepository repository;

  GetMyProfile(this.repository);

  @override
  Future<Either<Failure, lichess.User>> call(NoParams params) async =>
    repository.getUserProfile();
  
}
