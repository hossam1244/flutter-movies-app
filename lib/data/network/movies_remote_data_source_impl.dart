import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import '../../domain/entity/movie_entity.dart';
import '../models/movie_model.dart';
import 'movies_remote_data_source.dart';

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final Dio dio;

  MoviesRemoteDataSourceImpl({required this.dio});

  @override
  Future<MovieEntity> getMovies() async {
    final response = await dio.get(
        'https://api.themoviedb.org/3/discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=popularity.desc',
        options: Options(headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NTQyM2VkZTMxYzIwNWNkMWY2NzE0NWRmNGM1ZjM1NiIsInN1YiI6IjY1ZTc2OGJhMzFkMDliMDE2MmUzMTg3MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.U6Kmf_AsNdX4K4QjQcsnXIemeWqOWdalYGcs1ljmelY"
        }));

    if (response.statusCode == 200) {
      MovieEntity movieEntity =  MovieEntity.fromJson(response.data);
      return movieEntity;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
