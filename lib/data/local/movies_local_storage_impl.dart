import 'package:hive/hive.dart';
import 'package:sample_movies_app_flutter/domain/entity/movie_entity.dart';

import 'movies_local_storage_source.dart';

class MoviesLocalStorageImpl implements MoviesLocalDataSource {
  @override
  Future<MovieEntity> getMovies() {
    MovieEntity? movies = Hive.box<MovieEntity>('moviesBox').get(0);
    return Future.value(movies);
  }

  @override
  Future<void> saveMovies(MovieEntity movies) async {
    Hive.box<MovieEntity>('moviesBox').add(movies);
  }

  @override
  Future<void> addToFavorites(MovieEntity movieEntity) async {
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromFavorites(MovieEntity movieEntity) {
    throw UnimplementedError();
  }
}
