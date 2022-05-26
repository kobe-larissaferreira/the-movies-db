import 'dart:html';
import 'package:contentful/contentful.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/builder.dart';

part 'movie.g.dart';

@JsonSerializable()
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

@JsonSerializable()
class Movie {
  final String title;
  final DateTime release;
  final int runtime;
  final double popularity;
  final String overview;
  final String trailer;

  Movie(
      {this.title,
      this.release,
      this.overview,
      this.popularity,
      this.runtime,
      this.trailer});

  static Movie fromJson(Map<String, dynamic> json) {
    return _$MovieFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
