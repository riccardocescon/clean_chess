import 'package:cleanchess/features/clean_chess/presentation/blocs/account_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/game_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/puzzle_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/social_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/user_cubit.dart';
import 'package:cleanchess/injection_container.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class CubitHelper {
  Future<void> loadProfile(String userId) async {
    await sl<UserCubit>().getRealtimeStatus(userIds: [userId]);
    await sl<SocialCubit>().getFollowingUsers();
  }

  Future<void> loadModeStats({
    required String username,
    required PerfType mode,
  }) async {
    await sl<UserCubit>().getRatingHistory(
      username: username,
    );
    await sl<GameCubit>().exportGamesOfUser(
      username: username,
      perfTypes: [mode],
      opening: true,
    );
  }

  Future<void> loadHomepage() async {
    await sl<AccountCubit>().getMyProfile();
    await sl<PuzzleCubit>().getDailyPuzzle();
  }
}
