
import 'package:hive/hive.dart';

part 'movie_results_entity.g.dart';


@HiveType(typeId: 2)
class Results {
  @HiveField(0)
  bool? adult;
  @HiveField(1)
  String? backdropPath;
  @HiveField(2)
  List<int>? genreIds;
  @HiveField(3)
  int? id;
  @HiveField(4)
  List<String>? originCountry;
  @HiveField(5)
  String? originalLanguage;
  @HiveField(6)
  String? originalName;
  @HiveField(7)
  String? overview;
  @HiveField(8)
  double? popularity;
  @HiveField(9)
  String? posterPath;
  @HiveField(10)
  String? firstAirDate;
  @HiveField(11)
  String? name;
  @HiveField(12)
  double? voteAverage;
  @HiveField(13)
  int? voteCount;

  Results(
      {this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originCountry,
        this.originalLanguage,
        this.originalName,
        this.overview,
        this.popularity,
        this.posterPath,
        this.firstAirDate,
        this.name,
        this.voteAverage,
        this.voteCount});

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originCountry = json['origin_country'].cast<String>();
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    firstAirDate = json['first_air_date'];
    name = json['name'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['origin_country'] = this.originCountry;
    data['original_language'] = this.originalLanguage;
    data['original_name'] = this.originalName;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['first_air_date'] = this.firstAirDate;
    data['name'] = this.name;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}