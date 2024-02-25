import '../../domain/entity/movie_entity.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieEntity>> getMovies();
}