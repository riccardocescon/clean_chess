import 'package:cleanchess/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, P> {
  const UseCase();

  Future<Either<Failure, T>> call(P params);
}

abstract class UseCaseNoArgs<T> {
  const UseCaseNoArgs();

  Future<Either<Failure, T>> call();
}
