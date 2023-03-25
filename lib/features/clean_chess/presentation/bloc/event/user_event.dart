import 'package:cleanchess/features/clean_chess/presentation/bloc/server_event.dart';
import 'package:flutter/foundation.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_event.freezed.dart';

@freezed
abstract class UserEvent with _$UserEvent implements ServerEvent {
  const factory UserEvent.searchUsersByTerm({
    required String term,
    @Default(false) bool friend,
  }) = SearchUsersByTermEvent;

  const factory UserEvent.searchUsernamesByTerm({
    required String term,
    @Default(false) bool friend,
  }) = SearchUsernamesByTermEvent;

  const factory UserEvent.getRealtimeStatus({
    required List<String> ids,
    @Default(false) bool withGameIds,
  }) = GetRealtimeStatusEvent;

  // // Coming soon...
  const factory UserEvent.getTop10Players() = GetTop10PlayersEvent;

  // // Coming soon...
  const factory UserEvent.getChessVariantLeaderboard({
    required PerfType perfType,
    @Default(100) int nb,
  }) = GetChessVariantLeaderboardEvent;

  const factory UserEvent.getPublicData({
    required String username,
    @Default(false) bool trophies,
  }) = GetPublicDataEvent;

  const factory UserEvent.getRatingHistory({
    required String username,
  }) = GetRatingHistoryEvent;

  const factory UserEvent.getManyByIds({
    required List<String> ids,
  }) = GetManyByIdsEvent;

  const factory UserEvent.getLiveStreamers() = GetLiveStreamersEvent;
}
