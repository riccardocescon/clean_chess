import 'package:equatable/equatable.dart';

abstract class NetEvent extends Equatable {
  const NetEvent();

  @override
  List<Object> get props => [];
}

class NetLogin extends NetEvent {
  final String username;
  final String password;

  const NetLogin(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}
