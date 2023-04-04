import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/socials/socials.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

part 'social_cubit.freezed.dart';

@freezed
abstract class SocialState with _$SocialState, EquatableMixin {
  const factory SocialState.initial() = _InitialSocialState;

  const factory SocialState.loading() = _LoadingSocialState;

  const factory SocialState.followingUsers(List<User> users) =
      _FollowingUsersSocialState;

  const factory SocialState.userFollowed() = _UserFollowedSocialState;

  const factory SocialState.userUnfollowed() = _UserUnfollowedSocialState;

  const factory SocialState.failure(Failure error) = _ErrorSocialState;

  const SocialState._();

  @override
  List<Object?> get props {
    return maybeWhen(
      failure: (error) => [error],
      orElse: () => [],
    );
  }
}

class SocialCubit extends Cubit<SocialState> {
  SocialCubit({
    required GetFollowingUsers getFollowingUsers,
    required FollowUser followUser,
    required UnfollowUser unfollowUser,
  }) : super(const _InitialSocialState()) {
    _getFollowingUsers = getFollowingUsers;
    _followUser = followUser;
    _unfollowUser = unfollowUser;
  }

  late final GetFollowingUsers _getFollowingUsers;
  late final FollowUser _followUser;
  late final UnfollowUser _unfollowUser;

  Future<void> getFollowingUsers() async {
    emit(const _LoadingSocialState());
    final result = await _getFollowingUsers();
    result.fold(
      (failure) => emit(_ErrorSocialState(failure)),
      (users) => emit(_FollowingUsersSocialState(users)),
    );
  }

  Future<void> followUser(String username) async {
    emit(const _LoadingSocialState());
    final result = await _followUser(username);
    result.fold(
      (failure) => emit(_ErrorSocialState(failure)),
      (success) => emit(const _UserFollowedSocialState()),
    );
  }

  Future<void> unfollowUser(String username) async {
    emit(const _LoadingSocialState());
    final result = await _unfollowUser(username);
    result.fold(
      (failure) => emit(_ErrorSocialState(failure)),
      (success) => emit(const _UserUnfollowedSocialState()),
    );
  }
}
