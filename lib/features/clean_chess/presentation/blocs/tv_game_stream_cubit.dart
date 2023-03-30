import 'dart:async';

import 'package:cleanchess/features/clean_chess/domain/repositories/tv_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

@freezed
class TvGameStreamState extends Equatable {
  const TvGameStreamState({
    required this.status,
    required this.stream,
  });

  final TvGameStreamStateStatus status;
  final Stream<LichessTvGameSummary>? stream;

  @override
  List<Object?> get props => [status];
}

enum TvGameStreamStateStatus {
  initial,
  streaming,
}

class TvGameStreamCubit extends Cubit<AsyncSnapshot<LichessTvGameSummary>> {
  TvGameStreamCubit({
    required this.tvRepository,
  }) : super(const AsyncSnapshot.nothing());

  final TvRepository tvRepository;

  Stream<LichessTvGameSummary>? _stream;
  StreamSubscription<LichessTvGameSummary>? _subscription;

  Future<void> startStreaming() async {
    if (state.hasError) {
      await _cancelListener();
    } else {
      if (state.connectionState != ConnectionState.none) {
        // Already connected to something
        return;
      }
    }

    _establishStreamConnection();

    _startListener();
  }

  Future<void> _establishStreamConnection() async {
    final request = await tvRepository.streamCurrentTvGame();

    request.fold((l) {
      emit(AsyncSnapshot.withError(ConnectionState.none, l));
    }, (r) {
      _stream = r;
      _startListener();
    });
  }

  Future<void> _startListener() async {
    _subscription = _stream?.listen(
      (lichessGameSummary) {
        emit(
          AsyncSnapshot.withData(ConnectionState.active, lichessGameSummary),
        );
      },
      cancelOnError: true,
      onDone: _cancelListener,
      onError: (_, __) => _cancelListener(),
    );
  }

  Future<void> _cancelListener() async {
    await _subscription?.cancel();
    emit(const AsyncSnapshot.nothing());
  }

  @override
  Future<void> close() async {
    await _cancelListener();
    super.close();
  }
}
