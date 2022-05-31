import 'package:flutter/material.dart';
import 'app/data/model/movie.dart';
import 'app/data/repository/contentful_repository.dart';
import 'app/ui/pages/details_page.dart';

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
