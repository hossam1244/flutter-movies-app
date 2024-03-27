import 'package:equatable/equatable.dart';

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
        results!.add(new Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}
