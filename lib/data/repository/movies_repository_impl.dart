import 'package:sample_movies_app_flutter/data/datasource/local/movies_local_storage_source.dart';
import 'package:sample_movies_app_flutter/data/datasource/network/movies_remote_data_source.dart';
import 'package:sample_movies_app_flutter/data/entities/movie_entity.dart';
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
  Future<MainMoviesEntity> getMovies() async {
    if (await _networkInfo.isConnected) {
      MainMoviesEntity movies = await _moviesRemoteDataSource.getMovies();
      _moviesLocalDataStorage.saveMovies(movies);
      return Future.value(movies);
    } else {
      MainMoviesEntity? movies = await _moviesLocalDataStorage.getMovies();
      return Future.value(movies);
    }
  }
}
