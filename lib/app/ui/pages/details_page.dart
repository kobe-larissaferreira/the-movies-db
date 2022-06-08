import 'package:tmdbmovies/app/components/detailed_movie_card.dart';
import 'package:tmdbmovies/app/data/repository/contentful_repository.dart';
import 'package:tmdbmovies/app/data/model/movie.dart';
import 'package:tmdbmovies/app/ui/themes/app_color.dart';
import 'package:flutter/material.dart';

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


  // @override
  // Widget build(BuildContext context) {
  //   final altura = MediaQuery.of(context).size.height;
  //   final largura = MediaQuery.of(context).size.width;

  //   return Stack(
  //     children: [
  //       Container(
  //         // ignore: prefer_const_constructors
  //         foregroundDecoration: BoxDecoration(
  //           // ignore: prefer_const_constructors
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
  //       ListView(
  //         children: [
  //           Container(
  //             // height: altura * 0.5,
  //             // width: largura * 0.8,

  //             child: Image.asset(
  //               "assets/images/caroline.jpeg",
  //               // fit: BoxFit.contain,
  //               fit: BoxFit.cover,
  //               // color: Color(0xFF212121).withOpacity(1.0),
  //               // colorBlendMode: BlendMode.softLight,
  //             ),
  //           ),
  //         ],
  //       ),
  //       Positioned(
  //         left: 10,
  //         right: 60,
  //         top: 40,
  //         child: MovieAppBar(),
  //       )
  //     ],
  //   );

  //   implement build
  //   throw UnimplementedError();
  // }
//}
