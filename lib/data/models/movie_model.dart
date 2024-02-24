class MovieModel {
  String? title;
  String? poster;

  MovieModel({this.title, this.poster});

  MovieModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    poster = json['poster'];
  }
}
