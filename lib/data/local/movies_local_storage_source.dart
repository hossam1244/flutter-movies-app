import '../../domain/entity/movie_entity.dart';

abstract class MoviesLocalDataSource {
  Future<void> saveMovies(MovieEntity movies);

  Future<MovieEntity> getMovies();

  Future<void> addToFavorites(MovieEntity movieEntity);

  Future<void> removeFromFavorites(MovieEntity movieEntity);
}
