import 'package:cleanchess/features/clean_chess/presentation/bloc/server_event.dart';

abstract class SocialEvent implements ServerEvent {
  const SocialEvent();
}

class GetFollowingUsersEvent extends SocialEvent {
  const GetFollowingUsersEvent();
}

class FollowUserEvent extends SocialEvent {
  final String username;
  const FollowUserEvent({required this.username});
}

class UnfollowUserEvent extends SocialEvent {
  final String username;
  const UnfollowUserEvent({required this.username});
}
