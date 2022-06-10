import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:tmdbmovies/app/data/model/movie.dart';
import 'package:tmdbmovies/app/data/repository/contentful_repository.dart';
import 'package:tmdbmovies/app/routes/app_routes.dart';
import 'package:tmdbmovies/app/ui/pages/details_page.dart';
import 'package:tmdbmovies/app/ui/themes/app_color.dart';

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

  Future<List<MovieContent>> getMostPopular() {
    final mostPopular = Repository().getMovies();

    return mostPopular;
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
                          // print(movie.fields.title);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/${movie.fields.title}.jpeg",
                              width: 136,
                              height: 198,
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
