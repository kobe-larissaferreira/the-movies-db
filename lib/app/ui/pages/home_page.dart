// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:tmdbmovies/app/components/most_popular_card.dart';
import 'package:tmdbmovies/app/components/movie_list_card.dart';
import 'package:tmdbmovies/app/components/search_bar.dart';
import 'package:tmdbmovies/app/routes/app_routes.dart';
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
          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 155, 40, 40.0),
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
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.DETAILS);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 290),
              child: Container(
                  //esse aqui por alguma razao nao deu certo
                  margin: EdgeInsets.only(top: 250),
                  height: 200,
                  child: MovieListCard()),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.DETAILS);
            },
            child: Container(
                margin: EdgeInsets.only(top: 250),
                height: 200,
                child: MostPopularCard()),
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
        ],
      ),
    );
  }
}
