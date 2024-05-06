
import 'package:hive/hive.dart';

import 'movie_results_entity.dart';

part 'movie_entity.g.dart';

@HiveType(typeId: 1)
class MovieEntity extends HiveObject {
  @HiveField(0)
  int? page;
  @HiveField(1)
  List<Results>? results;
  @HiveField(2)
  int? totalPages;
  @HiveField(3)
  int? totalResults;

  MovieEntity({this.page, this.results, this.totalPages, this.totalResults});

  MovieEntity.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  List<Object?> get props => [page, results, totalPages, totalResults];
}
