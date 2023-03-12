import 'package:cleanchess/core/utilities/mixins/access_token_provider.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/lichess_data_source.dart';
import 'package:cleanchess/features/clean_chess/data/repositories/lichess_repository_impl.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/lichess_repositoy.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/account/account.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/oauth/oauth.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/lichess_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Register bloc
  sl.registerLazySingleton(
    () => LichessBloc(
      tokenProvider: sl<LichessTokenProvider>(),
      oauth: sl<LichessOAuth>(),
      gainAccessToken: sl<LichessGainAccessToken>(),
      getMyProfile: sl<GetMyProfile>(),
      getMyEmail: sl<GetMyEmail>(),
      getMyKidModeStatus: sl<GetMyKidModeStatus>(),
    ),
  );

  // Register usecases
  sl.registerLazySingleton(() => LichessTokenProvider());
  sl.registerLazySingleton(() => LichessOAuth(sl<LichessRepository>()));
  sl.registerLazySingleton(
    () => LichessGainAccessToken(lichessRepository: sl<LichessRepository>()),
  );
  sl.registerLazySingleton(() => GetMyProfile(sl<LichessRepository>()));
  sl.registerLazySingleton(() => GetMyEmail(sl<LichessRepository>()));
  sl.registerLazySingleton(() => GetMyKidModeStatus(sl<LichessRepository>()));

  // Register repositories
  sl.registerLazySingleton<LichessRepository>(() => LichessRepositoryImpl(
        remoteDataSource: sl<LichessDataSource>(),
      ));

  // Register data sources
  sl.registerLazySingleton<LichessDataSource>(() => LichessDataSource());
}
