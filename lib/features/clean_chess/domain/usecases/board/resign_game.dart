import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:dartz/dartz.dart';

class ResignGame extends UseCase<Empty, String> {
  @override
  Future<Either<Failure, Empty>> call(String params) {
    throw UnimplementedError();
  }
}
