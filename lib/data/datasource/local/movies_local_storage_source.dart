import '../../entities/movie_entity.dart';

abstract class MoviesLocalDataSource {
  Future<void> saveMovies(MainMoviesEntity movies);

  Future<MainMoviesEntity> getMovies();

  Future<void> addToFavorites(MainMoviesEntity movieEntity);

  Future<void> removeFromFavorites(MainMoviesEntity movieEntity);
}
