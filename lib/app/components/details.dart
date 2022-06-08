import 'package:tmdbmovies/app/components/detailed_movie_card.dart';
import 'package:tmdbmovies/app/data/repository/contentful_repository.dart';
import 'package:tmdbmovies/app/data/model/movie.dart';
import 'package:tmdbmovies/app/ui/themes/app_color.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({this.movieTitle, Key key}) : super(key: key);

  final String movieTitle;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Future<Movie> detailedMovie;
  @override
  void initState() {
    detailedMovie = Repository().getMovieDetail(widget.movieTitle);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: detailedMovie,
        builder: (context, AsyncSnapshot<Movie> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            return ListView(
              children: [
                DetailedMovieCard(detailedMovie: data),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Ocorreu um erro.',
                style: TextStyle(color: AppColors.title),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
