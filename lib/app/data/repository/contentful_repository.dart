import 'package:contentful/client.dart';
import 'package:flutter/material.dart';
import 'package:contentful/contentful.dart';
import 'package:tmdbmovies/app/data/model/movie.dart';

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

    print('total ${collection.total}');
    return collection.items;
  }
}
