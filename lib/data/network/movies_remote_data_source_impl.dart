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
  Future<List<MovieEntity>> getMovies() async {
    // final response = await dio.get('movies');
    String response = await rootBundle.loadString('assets/movies.json');
    final jsonResult = jsonDecode(response); //latest Dart
    final List<MovieEntity> movies = (jsonResult as List)
        .map((movie) => MovieModel.fromJson(movie))
        .toList();
    return movies;

    // if (response.statusCode == 200) {
    //   final List<MovieEntity> movies = (response.data as List)
    //       .map((movie) => MovieModel.fromJson(movie))
    //       .toList();
    //   return movies;
    // } else {
    //   throw Exception('Failed to load movies');
    // }
  }
}
