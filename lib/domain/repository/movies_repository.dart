import 'package:sample_movies_app_flutter/data/models/movie_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> getMovies();
}
