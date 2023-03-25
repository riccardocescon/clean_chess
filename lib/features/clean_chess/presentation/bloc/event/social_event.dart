import 'package:cleanchess/features/clean_chess/presentation/bloc/server_event.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_event.freezed.dart';

@freezed
abstract class SocialEvent with _$SocialEvent implements ServerEvent {
  const factory SocialEvent.getFollowingUsers() = GetFollowingUsersEvent;
  const factory SocialEvent.followUser({
    required String username,
  }) = FollowUserEvent;
  const factory SocialEvent.unfollowUser({
    required String username,
  }) = UnfollowUserEvent;
}
