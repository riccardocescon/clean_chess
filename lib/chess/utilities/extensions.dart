import 'package:dartz/dartz.dart';

extension EitherHelper<L, R> on Either {
  // Get [Left] value, may throw an exception when the value is [Right]
  L get left => fold<L>(
        (value) => value as L,
        (right) => throw Exception(
          'Illegal use. You should check isLeft before calling',
        ),
      );

  /// Get [Right] value, may throw an exception when the value is [Left]
  R get right => fold<R>(
        (left) => throw Exception(
          'Illegal use. You should check isRight before calling',
        ),
        (value) => value as R,
      );
  bool get isLeft => this is Left<L, R>;
}
