import 'package:sample_movies_app_flutter/data/models/movie_model.dart';
import 'package:sample_movies_app_flutter/domain/repository/movies_repository.dart';

import '../entity/movie_entity.dart';

class MoviesUseCases {
  MoviesUseCases({
    required MoviesRepository repository,
  }) : _repository = repository;

  final MoviesRepository _repository;

  Future<MovieEntity> getMovies() async {
    final movies = await _repository.getMovies();
    return movies;
  }
}