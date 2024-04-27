import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sample_movies_app_flutter/data/local/movies_local_storage_impl.dart';
import 'package:sample_movies_app_flutter/data/network/movies_remote_data_source.dart';
import 'package:sample_movies_app_flutter/data/network/movies_remote_data_source_impl.dart';
import 'package:sample_movies_app_flutter/domain/repository/movies_repository.dart';
import 'package:sample_movies_app_flutter/domain/repository/movies_repository_impl.dart';
import 'package:sample_movies_app_flutter/domain/usecase/movies_use_cases.dart';
import 'package:sample_movies_app_flutter/view/movies_list/bloc/movies_page_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network_info.dart';
import 'data/local/movies_local_storage_source.dart';

final serviceLocator = GetIt.instance;

/*
  Factory: always instantiate a new instance of the given class
  whenever we request.

  Singleton: always (after the first time) get the same instance,
  get_it will cache it and then on subsequent calls to it
  througout the lifetime of the app it's going to give out the same instance
  and not instantiate a new one since it's a single thing.

  -) Presentation logic holders such as BloC shouldn't be registered as
  singleton, because they are very close to the UI.
  For example the app has multiple pages between which you can navigate,
  you probably do not want this to be a singleton
  because you wanna do some cleanup like closing steams and
  all of that from the dispose method of a widget.

  -) Trying to close a stream but having a singleton will lead to problems,
  because you would close a stream but if you were to come back
  to the previous page on which that BloC is being used and
  you would try to get an instance from get_it of this number trivia BloC
  for example, and this was a singleton and not a factory, you would get
  the same instance of number trivia BloC as previously
  which now has a closed stream.

  *: Whenever you do some disposal logic you should always register Factory
  and not a singleton because then you are going to get the same instance
  with the close stream or close dispose whatever else and
  that's gonna cause some problem
*/

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  serviceLocator.registerFactory(
    () => MoviesPageBloc(
      moviesUseCases: serviceLocator(),
    ),
  );

  // Use cases (do not depend on implementation but on contract)
  // Singleton: always registered immediately after the app start
  // LazySingleton: registered only when it is requested
  // as dependency for some other class
  serviceLocator.registerLazySingleton(() => MoviesUseCases(
        repository: serviceLocator(),
      ));

  // Repository (Generic Contract)
  serviceLocator.registerLazySingleton<MoviesRepository>(
    () => MoviesRepositoryImpl(
      networkInfo: serviceLocator(),
      moviesLocalDataStorage: serviceLocator(),
      moviesRemoteDataSource: serviceLocator(),
    ),
  );

  // Data sources
  serviceLocator.registerLazySingleton<MoviesRemoteDataSource>(
    () => MoviesRemoteDataSourceImpl(dio: serviceLocator()),
  );

  serviceLocator.registerLazySingleton<MoviesLocalDataSource>(
    () => MoviesLocalStorageImpl(),
  );
  //! Core
  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(serviceLocator()),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );
  serviceLocator.registerLazySingleton(() => Dio());
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
}
