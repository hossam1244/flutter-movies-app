
import 'package:hive/hive.dart';

import 'movie_results_entity.dart';

part 'movie_entity.g.dart';

@HiveType(typeId: 1)
class MainMoviesEntity extends HiveObject {
  @HiveField(0)
  int? page;
  @HiveField(1)
  List<MoviesList>? moviesList;
  @HiveField(2)
  int? totalPages;
  @HiveField(3)
  int? totalResults;


  MainMoviesEntity({this.page, this.moviesList, this.totalPages, this.totalResults});

  MainMoviesEntity.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      moviesList = <MoviesList>[];
      json['results'].forEach((v) {
        moviesList!.add(MoviesList.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  List<Object?> get props => [page, moviesList, totalPages, totalResults];
}
