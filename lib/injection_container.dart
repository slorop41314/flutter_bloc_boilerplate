import 'package:flu_bloc_boilerplate/core/local/shared_pref.dart';
import 'package:flu_bloc_boilerplate/features/data/datasources/auth/auth_local_data_source.dart';
import 'package:flu_bloc_boilerplate/features/data/datasources/auth/auth_remote_data_source.dart';
import 'package:flu_bloc_boilerplate/features/data/repositories/auth_repository_impl.dart';
import 'package:flu_bloc_boilerplate/features/domain/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:flu_bloc_boilerplate/core/network/api_provider.dart';
import 'package:flu_bloc_boilerplate/features/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<ApiProvider>(
    () => ApiProviderImpl(),
  );
  // Register Bloc

  sl.registerFactory(
    () => AuthenticationBloc(
      repository: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      apiProvider: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      sharedPref: sl(),
    ),
  );
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      apiProvider: sl(),
    ),
  );
  // Others
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(
    () => SharedPreferencesManager(
      sharedPreferences: sl(),
    ),
  );
}
