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
  final String title;
  final DateTime release;
  final int runtime;
  final double popularity;
  final String textOverview;
  final String trailer;

  Movie(
      {this.title,
      this.release,
      this.textOverview,
      this.popularity,
      this.runtime,
      this.trailer});

  static Movie fromJson(Map<String, dynamic> json) {
    print('PEGOU MOVIE FROM JSON');
    print(json);
    return _$MovieFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
