import 'package:contentful/contentful.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final String title;
  final DateTime release;
  final int runtime;
  final double popularity;
  final String overview;
  final String trailer;

  Movie(
      {this.title = '',
      this.release = null,
      this.overview = '',
      this.popularity = 0,
      this.runtime = 0,
      this.trailer = ''});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
