import 'package:flutter/material.dart';
import 'app/data/model/movie.dart';

import 'app/data/repository/repository.dart';

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
    return FutureBuilder<List<MovieContent>>(
        future: Repository().getMovies(),
        builder: (context, snapshot) {
          var movies = (snapshot.data != null) ? snapshot.data : [];
          print(movies);
          return Scaffold(
            appBar: AppBar(
              title: Text('oi'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: movies
                    .map<Widget>(
                      (movie) => Text('Movie: ' + movie.fields.title),
                    )
                    .toList(),
              ),
            ),
          );
          print(movies);
        });
  }
}
