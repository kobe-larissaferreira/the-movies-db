import 'package:contentful/contentful.dart';

part 'movie.g.dart';

class MovieContent extends Entry<Movie> {
  MovieContent({
    SystemFields sys,
    Movie fields,
  }) : super(sys: sys, fields: fields);

  static MovieContent fromJson(Map<String, dynamic> json) {
    return _$MovieContentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieContentToJson(this);
}

class Movie {
  String title;
  DateTime releaseDate;
  int runtime;
  double popularity;
  String textOverview;
  String trailer;
  String image;

  Movie({
    this.title,
    this.releaseDate,
    this.textOverview,
    this.popularity,
    this.runtime,
    this.trailer,
    this.image,
  });

  static Movie fromJson(Map<String, dynamic> json) {
    return _$MovieFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
