import 'package:hive/hive.dart';
import 'package:sample_movies_app_flutter/data/entities/movie_entity.dart';

import 'movies_local_storage_source.dart';

class MoviesLocalStorageImpl implements MoviesLocalDataSource {
  @override
  Future<MainMoviesEntity> getMovies() {
    MainMoviesEntity? movies = Hive.box<MainMoviesEntity>('moviesBox').get(0);
    return Future.value(movies);
  }

  @override
  Future<void> saveMovies(MainMoviesEntity movies) async {
    Hive.box<MainMoviesEntity>('moviesBox').add(movies);
  }

  @override
  Future<void> addToFavorites(MainMoviesEntity movieEntity) async {
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromFavorites(MainMoviesEntity movieEntity) {
    throw UnimplementedError();
  }
}
