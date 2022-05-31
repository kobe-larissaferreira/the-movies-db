import 'package:contentful/client.dart';
import 'package:flutter/material.dart';
import 'package:contentful/contentful.dart';
import 'package:tmdbmovies/app/data/model/movie.dart';

class Repository {
  Client contentful =
      Client('5apq110l0nwi', '1VWkA_O8fZ1aNbOyhX28_r819bSQHwbkKxDeGgqi9hY');

  Future<List<MovieContent>> getMovies() async {
    final collection = await contentful.getEntries<MovieContent>(
      {'content_type': 'tmdbModel'},
      MovieContent.fromJson,
    );
    return collection.items;
  }

  Future<Movie> getMovieDetail(String id) async {
    //TODO: retornar um filme
    // final movie =
    //     await contentful.getEntry<MovieContent>(title, MovieContent.fromJson);
    return null;
  }
}
