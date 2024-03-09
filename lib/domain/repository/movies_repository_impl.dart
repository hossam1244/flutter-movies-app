import 'dart:ffi';

import 'package:hive/hive.dart';
import 'package:sample_movies_app_flutter/data/models/movie_model.dart';
import 'package:sample_movies_app_flutter/data/network/movies_remote_data_source.dart';
import 'package:sample_movies_app_flutter/domain/entity/movie_entity.dart';
import 'package:sample_movies_app_flutter/domain/repository/movies_repository.dart';
import '../../core/network_info.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final NetworkInfo _networkInfo;
  final MoviesRemoteDataSource _moviesRemoteDataSource;

  //final MoviesLocalStorage _moviesRemoteLocalStore;

  MoviesRepositoryImpl({
    required NetworkInfo networkInfo,
    required MoviesRemoteDataSource moviesRemoteDataSource,
  })  : _networkInfo = networkInfo,
        _moviesRemoteDataSource = moviesRemoteDataSource;

  @override
  Future<MovieEntity> getMovies() async {
    if (await _networkInfo.isConnected) {
      MovieEntity movies = await _moviesRemoteDataSource.getMovies();
      Hive.box<MovieEntity>('moviesBox').add(movies);
      return Future.value(movies);
    } else {
      MovieEntity? movies = Hive.box<MovieEntity>('moviesBox').get(0);
      return Future.value(movies);
    }
  }
}
