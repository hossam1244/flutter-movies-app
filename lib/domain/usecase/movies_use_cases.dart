import 'package:sample_movies_app_flutter/domain/repository/movies_repository.dart';
import '../../data/entities/movie_entity.dart';

class MoviesUseCases {
  MoviesUseCases({
    required MoviesRepository repository,
  }) : _repository = repository;

  final MoviesRepository _repository;

  Future<MainMoviesEntity> getMovies() async {
    final movies = await _repository.getMovies();
    return movies;
  }

  Future<void> addToFavorites(int movieId) async {

  }
}