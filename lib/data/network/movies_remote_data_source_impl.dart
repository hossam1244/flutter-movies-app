import 'package:dio/dio.dart';
import '../models/movie_model.dart';
import 'movies_remote_data_source.dart';

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final Dio _dio;

  MoviesRemoteDataSourceImpl(this._dio);

  @override
  Future<List<MovieModel>> getMovies() async {
    final response = await _dio.get('movies');
    if (response.statusCode == 200) {
      final List<MovieModel> movies = (response.data as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
