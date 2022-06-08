// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tmdbmovies/app/components/most_popular_card.dart';
import 'package:tmdbmovies/app/components/movie_list_card.dart';
import 'package:tmdbmovies/app/components/search_bar.dart';
import 'package:tmdbmovies/app/ui/themes/app_color.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.5, 1),
                colors: <Color>[
                  Color(0xff60368A),
                  Color(0xff000000),
                  Color(0xff000000),
                ],
                tileMode: TileMode.mirror,
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 100, top: 70),
              child: Text("O que você quer assistir hoje?",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: AppColors.shape,
                      fontSize: 26,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          SearchBar(),
          Container(
              margin: EdgeInsets.only(top: 250),
              height: 200,
              child: MovieListCard()),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 100, top: 480),
            child: Text(
              "Mais populares",
              style: TextStyle(
                  color: AppColors.shape,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              //esse aqui por alguma razao nao deu certo
              margin: EdgeInsets.only(top: 250),
              height: 200,
              child: MostPopularCard()),
        ],
      ),
    );
  }
}
