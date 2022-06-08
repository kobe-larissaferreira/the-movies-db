import 'package:tmdbmovies/app/components/details.dart';
import 'package:tmdbmovies/app/ui/themes/app_color.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key key}) : super(key: key);

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
              child: Text("Detalhes: ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: AppColors.shape,
                      fontSize: 26,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            alignment: Alignment.topCenter,
            child: Details(
              movieTitle: 'Batman',
            ),
          ),
        ],
      ),
    );
  }
}
