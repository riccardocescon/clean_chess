import 'package:equatable/equatable.dart';

class Tuple<F, S> with EquatableMixin {
  F first;
  S second;

  Tuple(this.first, this.second);

  @override
  List<Object?> get props => [first, second];
}
