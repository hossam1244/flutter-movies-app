import 'package:sample_movies_app_flutter/data/local/movies_local_storage_source.dart';
import 'package:sample_movies_app_flutter/data/network/movies_remote_data_source.dart';
import 'package:sample_movies_app_flutter/domain/entity/movie_entity.dart';
import 'package:sample_movies_app_flutter/domain/repository/movies_repository.dart';
import '../../core/network_info.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final NetworkInfo _networkInfo;
  final MoviesRemoteDataSource _moviesRemoteDataSource;
  final MoviesLocalDataSource _moviesLocalDataStorage;

  MoviesRepositoryImpl({
    required NetworkInfo networkInfo,
    required MoviesRemoteDataSource moviesRemoteDataSource,
    required MoviesLocalDataSource moviesLocalDataStorage,
  })  : _networkInfo = networkInfo,
        _moviesRemoteDataSource = moviesRemoteDataSource,
        _moviesLocalDataStorage = moviesLocalDataStorage;

  @override
  Future<MovieEntity> getMovies() async {
    if (await _networkInfo.isConnected) {
      MovieEntity movies = await _moviesRemoteDataSource.getMovies();
      _moviesLocalDataStorage.saveMovies(movies);
      return Future.value(movies);
    } else {
      MovieEntity? movies = await _moviesLocalDataStorage.getMovies();
      return Future.value(movies);
    }
  }
}
