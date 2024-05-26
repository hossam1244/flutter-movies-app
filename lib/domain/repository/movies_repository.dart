import 'package:sample_movies_app_flutter/data/entities/movie_entity.dart';

abstract class MoviesRepository {
  Future<MainMoviesEntity> getMovies();
}
