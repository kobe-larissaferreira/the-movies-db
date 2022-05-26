import 'package:contentful/client.dart';
import 'package:flutter/material.dart';
import 'package:tmdbmovies/models/movie.dart';
import 'package:contentful/contentful.dart';

class Repository {
  Client contentful =
      Client('5apq110l0nwi', '1VWkA_O8fZ1aNbOyhX28_r819bSQHwbkKxDeGgqi9hY');

  Future<List<MovieContent>> getMovies() async {
    print('OI');
    print(contentful.toString());
    final collection = await contentful.getEntries<MovieContent>(
      {'content_type': 'tmdbModel'},
      MovieContent.fromJson,
    );
    print(collection);
    return collection.items;
  }
}
