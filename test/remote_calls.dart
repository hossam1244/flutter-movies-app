import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sample_movies_app_flutter/core/network_info.dart';
import 'package:sample_movies_app_flutter/data/local/MoviesLocalStorage.dart';
import 'package:sample_movies_app_flutter/data/network/movies_remote_data_source.dart';
import 'package:sample_movies_app_flutter/data/network/movies_remote_data_source_impl.dart';
import 'package:sample_movies_app_flutter/domain/entity/movie_entity.dart';
import 'package:sample_movies_app_flutter/domain/repository/movies_repository.dart';
import 'package:sample_movies_app_flutter/domain/repository/movies_repository_impl.dart';
import 'package:sample_movies_app_flutter/domain/usecase/movies_use_cases.dart';

void main() {
  MoviesUseCases? _moviesUseCases;
  MoviesRepositoryImpl _moviesRepositoryImpl;
  MoviesRemoteDataSourceImpl _moviesRemoteDataSourceImpl;
  MoviesLocalDataStorage _moviesLocalDataStorage;
  NetworkInfo _networkInfo;
  InternetConnectionChecker _internetConnectionChecker;
  Dio _dio;

  setUp(() {
    _dio = Dio();
    _internetConnectionChecker = InternetConnectionChecker();
    _moviesLocalDataStorage = MoviesLocalDataStorage();
    _networkInfo = NetworkInfoImpl(_internetConnectionChecker);
    _moviesRemoteDataSourceImpl = MoviesRemoteDataSourceImpl(dio: _dio);
    _moviesRepositoryImpl = MoviesRepositoryImpl(
        networkInfo: _networkInfo,
        moviesLocalDataStorage: _moviesLocalDataStorage,
        moviesRemoteDataSource: _moviesRemoteDataSourceImpl);
    _moviesUseCases = MoviesUseCases(repository: _moviesRepositoryImpl);
  });

  test("getMovies", () async {
    final result = await _moviesUseCases?.getMovies();
    expect(result, isA<MovieEntity>());
  });
}
