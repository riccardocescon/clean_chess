import 'package:cleanchess/features/clean_chess/presentation/blocs/social_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/user_cubit.dart';
import 'package:cleanchess/injection_container.dart';

class CubitHelper {
  Future<void> loadProfile(String userId) async {
    await sl<UserCubit>().getRealtimeStatus(userIds: [userId]);
    await sl<SocialCubit>().getFollowingUsers();
  }
}
