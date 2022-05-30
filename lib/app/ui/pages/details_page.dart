import 'package:flutter/material.dart';
import 'package:tmdbmovies/app/components/detailed_movie_card.dart';
import 'package:tmdbmovies/app/data/repository/contentful_repository.dart';
import 'package:tmdbmovies/app/data/model/movie.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({this.movieTitle, Key key}) : super(key: key);

  final String movieTitle;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Future<MovieContent> detailedMovie;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
