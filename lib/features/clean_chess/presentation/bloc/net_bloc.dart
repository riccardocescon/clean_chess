import 'package:cleanchess/features/cleanchess/domain/entities/net_login_data.dart';
import 'package:cleanchess/features/cleanchess/domain/usecases/login.dart';
import 'package:cleanchess/features/cleanchess/presentation/bloc/net_event.dart';
import 'package:cleanchess/features/cleanchess/presentation/bloc/net_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetBloc extends Bloc<NetEvent, NetState> {
  final Login login;

  NetBloc({required this.login}) : super(NetInitial()) {
    on<NetLogin>((event, emit) async {
      emit(NetLoading());
      try {
        final data = await login.call(LoginParams(
          username: event.username,
          password: event.password,
        ));
        data.fold(
          (error) => emit(NetError(error.message)),
          (account) => Right(emit(NetLoaded<Account>(account))),
        );
      } catch (e) {
        emit(NetError(e.toString()));
      }
    });
  }
}
