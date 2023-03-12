import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/lichess_repositoy.dart';
import 'package:dartz/dartz.dart';

class GetMyEmail extends UseCase<String, NoParams> {
  final LichessRepository repository;

  GetMyEmail(this.repository);

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await repository.getMyEmail();
  }
}
