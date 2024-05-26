import '../../entities/movie_entity.dart';

abstract class MoviesRemoteDataSource {
  Future<MainMoviesEntity> getMovies();
}