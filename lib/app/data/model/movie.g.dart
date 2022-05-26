// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieContent _$MovieContentFromJson(Map<String, dynamic> json) {
  return MovieContent(
    sys: json['sys'] == null
        ? null
        : SystemFields.fromJson(json['sys'] as Map<String, dynamic>),
    fields: json['fields'] == null
        ? null
        : Movie.fromJson(json['fields'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MovieContentToJson(MovieContent instance) =>
    <String, dynamic>{
      'sys': instance.sys,
      'fields': instance.fields,
    };

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    title: json['title'] as String,
    release: json['release'] == null
        ? null
        : DateTime.parse(json['release'] as String),
    textOverview: json['textOverview'] as String,
    popularity: (json['popularity'] as num).toDouble(),
    runtime: json['runtime'] as int,
    trailer: json['trailer'] as String,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'title': instance.title,
      'release': instance.release?.toIso8601String(),
      'runtime': instance.runtime,
      'popularity': instance.popularity,
      'textOverview': instance.textOverview,
      'trailer': instance.trailer,
    };
