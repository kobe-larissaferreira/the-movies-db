import 'package:flutter/material.dart';
import 'package:tmdbmovies/app/components/detailed_movie_card.dart';
import 'package:tmdbmovies/app/data/repository/contentful_repository.dart';
import 'package:tmdbmovies/app/data/model/movie.dart';
import 'package:tmdbmovies/app/ui/themes/app_color.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({this.movieTitle, Key key}) : super(key: key);

  final String movieTitle;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Future<Movie> detailedMovie;
  @override
  void initState() {
    detailedMovie = Repository().getMovieDetail(widget.movieTitle);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('oi'),
      ),
      body: FutureBuilder(
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
          }),
    );
  }
}
