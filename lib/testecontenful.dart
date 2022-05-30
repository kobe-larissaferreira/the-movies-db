import 'package:flutter/material.dart';
import 'app/data/model/movie.dart';

import 'app/data/repository/contentful_repository.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieContent>(
        future: Repository().getMovieDetail('Morbius (2022)'),
        builder: (context, snapshot) {
          var movies = (snapshot.data != null) ? snapshot.data : [];
          return Scaffold(
            appBar: AppBar(
              title: Text('oi'),
            ),
            body: Center(
              child: Text('Movie: ${movies}'),
            ),
          );
        });
  }
}
