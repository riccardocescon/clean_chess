import 'package:cleanchess/features/clean_chess/data/datasources/lichess_data_source.dart';
import 'package:cleanchess/features/clean_chess/data/repositories/lichess_repository_impl.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/lichess_repositoy.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/get_my_profile.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/lichess_gain_access_token.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/lichess_oauth.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/lichess_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Register bloc
  sl.registerLazySingleton(() => LichessBloc(
        oauth: sl<LichessOAuth>(),
        gainAccessToken: sl<LichessGainAccessToken>(),
        getMyProfile: sl<GetMyProfile>(),
      ));

  // Register usecases
  sl.registerLazySingleton(() => LichessOAuth(sl<LichessRepository>()));
  sl.registerLazySingleton(
    () => LichessGainAccessToken(lichessRepository: sl<LichessRepository>()),
  );
  sl.registerLazySingleton(() => GetMyProfile(sl<LichessRepository>()));

  // Register repositories
  sl.registerLazySingleton<LichessRepository>(() => LichessRepositoryImpl(
        remoteDataSource: sl<LichessDataSource>(),
      ));

  // Register data sources
  sl.registerLazySingleton<LichessDataSource>(() => LichessDataSource());
}
