import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tmdbmovies/app/components/search_bar.dart';
import 'package:tmdbmovies/app/data/model/movie.dart';
import 'package:tmdbmovies/app/data/repository/contentful_repository.dart';
import 'package:tmdbmovies/app/routes/app_routes.dart';
import 'package:tmdbmovies/app/ui/themes/app_color.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key key}) : super(key: key);

  @override
  _HomePageState2 createState() => _HomePageState2();
}

class _HomePageState2 extends State<HomePage2> {
  Future<List<MovieContent>> collection;

  @override
  initState() {
    final collection = Repository().getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieContent>>(
        future: collection,
        builder: (context, snapshot) {
          var movies = (snapshot.data != null) ? snapshot.data : [];
          return Scaffold(
            body: Flex(
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
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 100, top: 70),
                  child: Text(
                    "O que voce quer assistir hoje?",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: AppColors.shape,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SearchBar(),
                Container(
                  margin: const EdgeInsets.only(top: 250),
                  height: 200,
                  child: Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: movies
                          .map<Widget>(
                            (movie) => Expanded(
                              child: Image.asset(
                                  "assets/images/${movie.fields.title}.jpeg"),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

//   return FutureBuilder<List<MovieContent>>(
//     future: collection,
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
//                           Image.asset(
//                               "assets/images/${movie.fields.title}.jpeg")
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
//     },
//   );
// }
