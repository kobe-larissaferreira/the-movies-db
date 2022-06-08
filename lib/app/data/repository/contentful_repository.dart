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

  Future<Movie> getMovieDetail(String movieTitle) async {
    Movie movie;
    final collection = await getMovies();
    collection
        .forEach((element) => element.fields.title.toString() == movieTitle
            ? movie = Movie(
                title: element.fields.title,
                textOverview: element.fields.textOverview,
                trailer: element.fields.trailer,
                runtime: element.fields.runtime,
                releaseDate: element.fields.releaseDate,
                popularity: element.fields.popularity,
                image: "assets/images/${movieTitle}.jpeg",
              )
            : null);

    return movie;
  }
}
