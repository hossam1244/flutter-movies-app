
import 'package:sample_movies_app_flutter/data/models/movie_model.dart';
import 'package:sample_movies_app_flutter/domain/repository/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  // final Api _api;
  // final LocalStorage _localStorage;

  // MoviesRepositoryImpl({
  //   required Api api,
  //   required LocalStorage localStorage,
  // })  : _api = api,
  //       _localStorage = localStorage;


  @override
  Future<List<MovieModel>> getMovies() {
    // TODO: implement getMovies
    throw UnimplementedError();
  }
}