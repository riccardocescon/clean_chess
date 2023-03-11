import 'package:cleanchess/features/clean_chess/data/datasources/lichess_data_source.dart';
import 'package:cleanchess/features/clean_chess/data/repositories/lichess_repository_impl.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/lichess_repositoy.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/lichess_oauth.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/lichess_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Register bloc
  sl.registerLazySingleton(() => LichessBloc(oauth: sl<LichessOAuth>()));

  // Register usecases
  sl.registerLazySingleton(() => LichessOAuth(sl<LichessRepository>()));

  // Register repositories
  sl.registerLazySingleton<LichessRepository>(() => LichessRepositoryImpl(
        remoteDataSource: sl<LichessDataSource>(),
      ));

  // Register data sources
  sl.registerLazySingleton<LichessDataSource>(() => LichessDataSource());
}
