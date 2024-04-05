import 'package:sample_movies_app_flutter/domain/entity/movie_entity.dart';

abstract class MoviesRepository {
  Future<MovieEntity> getMovies();
}
