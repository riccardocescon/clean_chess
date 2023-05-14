import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/users/users.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

part 'user_cubit.freezed.dart';

@freezed
abstract class UserState with _$UserState, EquatableMixin {
  const factory UserState.initial() = _InitialUserState;

  const factory UserState.loading() = _LoadingUserState;

  const factory UserState.usersByTerm(List<User> user) = _UsersByTermUserState;

  const factory UserState.usernamesByTerm(List<String> users) =
      _UsernamesByTermUserState;

  const factory UserState.realtimeStatus(
    List<RealTimeUserStatus> realtimeStatus,
  ) = _RealtimeStatusUserState;

  /// Coming soon...
  const factory UserState.top10Players(Map<String, List<User>> data) =
      _Top10PlayersUserState;

  /// Coming soon...
  const factory UserState.chessVariantLeaderboard(List<User> users) =
      _ChessVariantLeaderboardUserState;

  const factory UserState.publicData(User user) = _PublicDataUserState;

  const factory UserState.ratingHistory(List<RatingHistory> ratings) =
      _RatingHistoryUserState;

  const factory UserState.usersByIds(List<User> users) = _UsersByIdsUserState;

  const factory UserState.failure(Failure error) = _ErrorUserState;

  const UserState._();

  @override
  List<Object?> get props {
    return maybeWhen(
      failure: (error) => [error],
      orElse: () => [],
    );
  }
}

class UserCubit extends Cubit<UserState> {
  UserCubit({
    required SearchUserByTerm searchUsersByTerm,
    required SearchUsernamesByTerm getUsernamesByTerm,
    required GetRealtimeStatus getRealtimeStatus,
    required GetTop10Players getTop10Players,
    required GetChessVariantLeaderboard getChessVariantLeaderboard,
    required GetPublicData getPublicData,
    required GetRatingHistory getRatingHistory,
    required GetManyByIds getManyByIds,
    required GetLiveStreamers getLiveStreamers,
  }) : super(const _InitialUserState()) {
    _searchUsersByTerm = searchUsersByTerm;
    _getUsernamesByTerm = getUsernamesByTerm;
    _getRealtimeStatus = getRealtimeStatus;
    _getTop10Players = getTop10Players;
    _getChessVariantLeaderboard = getChessVariantLeaderboard;
    _getPublicData = getPublicData;
    _getRatingHistory = getRatingHistory;
    _getManyByIds = getManyByIds;
    _getLiveStreamers = getLiveStreamers;
  }

  late final SearchUserByTerm _searchUsersByTerm;
  late final SearchUsernamesByTerm _getUsernamesByTerm;
  late final GetRealtimeStatus _getRealtimeStatus;
  late final GetTop10Players _getTop10Players;
  late final GetChessVariantLeaderboard _getChessVariantLeaderboard;
  late final GetPublicData _getPublicData;
  late final GetRatingHistory _getRatingHistory;
  late final GetManyByIds _getManyByIds;
  late final GetLiveStreamers _getLiveStreamers;

  Future<void> searchUsersByTerm({
    required String term,
    bool friend = false,
  }) async {
    emit(const _LoadingUserState());
    final result = await _searchUsersByTerm(
      SearchUsersByTermParams(term, friend),
    );
    result.fold(
      (failure) => emit(_ErrorUserState(failure)),
      (user) => emit(_UsersByTermUserState(user)),
    );
  }

  Future<void> getUsernamesByTerm({
    required String term,
    bool friend = false,
  }) async {
    emit(const _LoadingUserState());
    final result = await _getUsernamesByTerm(
      SearchUsernamesByTermParams(term, friend),
    );
    result.fold(
      (failure) => emit(_ErrorUserState(failure)),
      (user) => emit(_UsernamesByTermUserState(user)),
    );
  }

  Future<void> getRealtimeStatus({
    required List<String> userIds,
    bool withGameIds = false,
  }) async {
    emit(const _LoadingUserState());
    final result = await _getRealtimeStatus(
      GetRealtimeStatusParams(
        userIds,
        withGameIds,
      ),
    );
    result.fold(
      (failure) => emit(_ErrorUserState(failure)),
      (user) => emit(_RealtimeStatusUserState(user)),
    );
  }

  Future<void> getTop10Players({
    required String variant,
  }) async {
    emit(const _LoadingUserState());
    final result = await _getTop10Players();
    result.fold(
      (failure) => emit(_ErrorUserState(failure)),
      (user) => emit(_Top10PlayersUserState(user)),
    );
  }

  Future<void> getChessVariantLeaderboard({
    required PerfType variant,
    int nb = 10,
  }) async {
    emit(const _LoadingUserState());
    final result = await _getChessVariantLeaderboard(
      GetChessVariantLeaderboardParams(variant, nb),
    );
    result.fold(
      (failure) => emit(_ErrorUserState(failure)),
      (user) => emit(_ChessVariantLeaderboardUserState(user)),
    );
  }

  Future<void> getPublicData({
    required String userId,
  }) async {
    emit(const _LoadingUserState());
    final result = await _getPublicData(
      GetPublicDataParams(userId),
    );
    result.fold(
      (failure) => emit(_ErrorUserState(failure)),
      (user) => emit(_PublicDataUserState(user)),
    );
  }

  Future<void> getRatingHistory({
    required String username,
  }) async {
    emit(const _LoadingUserState());
    final result = await _getRatingHistory(username);
    result.fold(
      (failure) => emit(_ErrorUserState(failure)),
      (ratings) => emit(_RatingHistoryUserState(ratings)),
    );
  }

  Future<void> getManyByIds({
    required List<String> ids,
  }) async {
    emit(const _LoadingUserState());
    final result = await _getManyByIds(ids);
    result.fold(
      (failure) => emit(_ErrorUserState(failure)),
      (users) => emit(_UsersByIdsUserState(users)),
    );
  }

  Future<void> getLiveStreamers() async {
    emit(const _LoadingUserState());
    final result = await _getLiveStreamers();
    result.fold(
      (failure) => emit(_ErrorUserState(failure)),
      (users) => emit(_UsersByIdsUserState(users)),
    );
  }
}
