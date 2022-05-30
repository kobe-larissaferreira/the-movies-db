// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdbmovies/app/data/model/movie.dart';
import 'package:tmdbmovies/app/data/repository/contentful_repository.dart';
import 'package:tmdbmovies/app/ui/themes/app_color.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Stack(
    //     children: [
    //       Container(
    //         decoration: const BoxDecoration(
    //           gradient: LinearGradient(
    //             begin: Alignment.topLeft,
    //             end: Alignment(0.5, 1),
    //             colors: <Color>[
    //               Color(0xff60368A),
    //               Color(0xff000000),
    //               Color(0xff000000),
    //             ],
    //             tileMode: TileMode.mirror,
    //           ),
    //         ),
    //       ),
    //       Container(
    //         child: Padding(
    //           padding: const EdgeInsets.only(left: 30, right: 100, top: 70),
    //           child: Text("O que você quer assistir hoje?",
    //               textAlign: TextAlign.start,
    //               style: TextStyle(
    //                   color: AppColors.shape,
    //                   fontSize: 26,
    //                   fontWeight: FontWeight.bold)),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
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
              child: Expanded(
                child: ListView(
                  children: movies
                      .map<Widget>(
                        (movie) => Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Movie: ' + movie.fields.title,
                              ),
                              Text('Runtime: ' +
                                  movie.fields.runtime.toString()),
                              Text('Release: ' +
                                  movie.fields.releaseDate.toString()),
                              Text('Popularity: ' +
                                  movie.fields.popularity.toString()),
                              Text('Overview: ' +
                                  movie.fields.textOverview.toString()),
                              // Text('Imagem' + movie.fields.image.toString()),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          );
          print(movies);
        });
  }
}
