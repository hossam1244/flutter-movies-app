
import 'package:sample_movies_app_flutter/data/models/movie_model.dart';
import 'package:sample_movies_app_flutter/data/network/movies_remote_data_source.dart';
import 'package:sample_movies_app_flutter/domain/repository/movies_repository.dart';
import '../../core/network_info.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final NetworkInfo _networkInfo;
  final MoviesRemoteDataSource _moviesRemoteDataSource;
  //final MoviesLocalStorage _moviesRemoteLocalStore;

  MoviesRepositoryImpl({
    required NetworkInfo networkInfo,
    required MoviesRemoteDataSource moviesRemoteDataSource,
  })  : _networkInfo = networkInfo,
        _moviesRemoteDataSource = moviesRemoteDataSource;


  @override
  Future<List<MovieModel>> getMovies() {
    // TODO: implement getMovies
    throw UnimplementedError();
  }
}