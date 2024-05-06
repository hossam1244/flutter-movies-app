import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sample_movies_app_flutter/core/network_info.dart';
import 'package:sample_movies_app_flutter/data/local/movies_local_storage_impl.dart';
import 'package:sample_movies_app_flutter/data/local/movies_local_storage_source.dart';
import 'package:sample_movies_app_flutter/data/network/movies_remote_data_source_impl.dart';
import 'package:sample_movies_app_flutter/domain/entity/movie_entity.dart';
import 'package:sample_movies_app_flutter/domain/repository/movies_repository_impl.dart';
import 'package:sample_movies_app_flutter/domain/usecase/movies_use_cases.dart';

void main() {
  MoviesUseCases? moviesUseCases;
  MoviesRepositoryImpl moviesRepositoryImpl;
  MoviesRemoteDataSourceImpl moviesRemoteDataSourceImpl;
  MoviesLocalDataSource moviesLocalDataStorage;
  NetworkInfo networkInfo;
  InternetConnectionChecker internetConnectionChecker;
  Dio dio;

  setUp(() {
    dio = Dio();
    internetConnectionChecker = InternetConnectionChecker();
    moviesLocalDataStorage = MoviesLocalStorageImpl();
    networkInfo = NetworkInfoImpl(internetConnectionChecker);
    moviesRemoteDataSourceImpl = MoviesRemoteDataSourceImpl(dio: dio);
    moviesRepositoryImpl = MoviesRepositoryImpl(
        networkInfo: networkInfo,
        moviesLocalDataStorage: moviesLocalDataStorage,
        moviesRemoteDataSource: moviesRemoteDataSourceImpl);
    moviesUseCases = MoviesUseCases(repository: moviesRepositoryImpl);
  });

  test("getMovies", () async {
    final result = await moviesUseCases?.getMovies();
    expect(result, isA<MovieEntity>());
  });
}
