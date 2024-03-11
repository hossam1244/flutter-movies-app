import 'package:hive/hive.dart';

import '../../domain/entity/movie_entity.dart';

class MoviesLocalDataStorage {
  Future<MovieEntity> getMovies() async {
    MovieEntity? movies = Hive.box<MovieEntity>('moviesBox').get(0);
    return Future.value(movies);
  }

  Future<void> saveMovies(MovieEntity movies) async {
    Hive.box<MovieEntity>('moviesBox').add(movies);
  }
}