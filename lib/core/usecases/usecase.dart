import 'package:cleanchess/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseNoArgs<Type> {
  const UseCaseNoArgs();
  Future<Either<Failure, Type>> call();
}
