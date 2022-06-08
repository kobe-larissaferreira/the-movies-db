import 'package:flutter/material.dart';
import 'package:tmdbmovies/app/data/model/movie.dart';
import 'package:tmdbmovies/app/data/repository/contentful_repository.dart';

class MostPopularCard extends StatefulWidget {
  const MostPopularCard({Key key}) : super(key: key);

  @override
  _MostPopularCardState createState() => _MostPopularCardState();
}

class _MostPopularCardState extends State<MostPopularCard> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieContent>>(
        future: Repository().getMovies(),
        builder: (context, snapshot) {
          var movies = (snapshot.data != null) ? snapshot.data : [];
          return Scaffold(
            body: Center(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: movies
                    .map<Widget>(
                      (movie) => Column(
                        children: [
                          Image.asset(
                            "assets/images/${movie.fields.title}.jpeg",
                            width: 134,
                            height: 188,
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        });
  }
}
