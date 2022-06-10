import 'package:flutter/material.dart';
import 'package:tmdbmovies/app/data/model/movie.dart';
import 'package:tmdbmovies/app/data/repository/contentful_repository.dart';
import 'package:tmdbmovies/app/ui/pages/details_page.dart';
import 'package:tmdbmovies/app/ui/themes/app_color.dart';

class MovieListCard extends StatefulWidget {
  const MovieListCard({Key key}) : super(key: key);

  @override
  _MovieListCardState createState() => _MovieListCardState();
}

class _MovieListCardState extends State<MovieListCard> {
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
            backgroundColor: AppColors.black,
            body: Center(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: movies
                    .map<Widget>(
                      (movie) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DetailPage(),
                                  settings: RouteSettings(
                                      arguments: movie.fields.title)));
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/${movie.fields.title}.jpeg",
                              width: 134,
                              height: 188,
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        });
  }
}
