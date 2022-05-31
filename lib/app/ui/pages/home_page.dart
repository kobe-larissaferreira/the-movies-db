// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdbmovies/app/data/model/movie.dart';
import 'package:tmdbmovies/app/data/repository/contentful_repository.dart';
import 'package:tmdbmovies/app/ui/themes/app_color.dart';

class HomePage extends StatelessWidget {
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 155, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  autofocus: false,
                  style: TextStyle(color: AppColors.shape),
                  decoration: InputDecoration(
                    hintText: "Buscar",
                    suffixIcon: Icon(
                      Icons.search,
                      color: AppColors.shape,
                    ),
                    hintStyle: TextStyle(color: AppColors.shape, fontSize: 12),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.shape),
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 250),
            height: 200,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 134,
                  height: 188,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage("assets/images/caroline.jpeg"),
                    ),
                  ),
                ),
                Container(
                  width: 134,
                  height: 188,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage("assets/images/harryPotter.jpeg"),
                    ),
                  ),
                ),
                Container(
                  width: 134,
                  height: 188,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage("assets/images/cruella.jpeg"),
                    ),
                  ),
                ),
                Container(
                  width: 134,
                  height: 188,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage("assets/images/duna.jpeg"),
                    ),
                  ),
                ),
                Container(
                  width: 134,
                  height: 188,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage("assets/images/matrix.jpeg"),
                    ),
                  ),
                ),
                Container(
                  width: 134,
                  height: 188,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage("assets/images/space.jpeg"),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
            margin: EdgeInsets.only(top: 450),
            height: 350,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 134,
                  height: 188,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage("assets/images/homemAranha.jpeg"),
                    ),
                  ),
                ),
                Container(
                  width: 134,
                  height: 188,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage("assets/images/foradomapa.jpeg"),
                    ),
                  ),
                ),
                Container(
                  width: 134,
                  height: 188,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage("assets/images/morbius.jpeg"),
                    ),
                  ),
                ),
                Container(
                  width: 134,
                  height: 188,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage("assets/images/batman.jpeg"),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

    // return FutureBuilder<List<MovieContent>>(
    //     future: Repository().getMovies(),
    //     builder: (context, snapshot) {
    //       var movies = (snapshot.data != null) ? snapshot.data : [];
    //       print(movies);
    //       return Scaffold(
    //         appBar: AppBar(
    //           title: Text('oi'),
    //         ),
    //         body: Center(
    //           child: Expanded(
    //             child: ListView(
    //               children: movies
    //                   .map<Widget>(
    //                     (movie) => Expanded(
    //                       child: Column(
    //                         children: [
    //                           Text(
    //                             'Movie: ' + movie.fields.title,
    //                           ),
    //                           Text('Runtime: ' +
    //                               movie.fields.runtime.toString()),
    //                           Text('Release: ' +
    //                               movie.fields.releaseDate.toString()),
    //                           Text('Popularity: ' +
    //                               movie.fields.popularity.toString()),
    //                           Text('Overview: ' +
    //                               movie.fields.textOverview.toString()),
    //                         ],
    //                       ),
    //                     ),
    //                   )
    //                   .toList(),
    //             ),
    //           ),
    //         ),
    //       );
    //       print(movies);
    //     });
  }
}
