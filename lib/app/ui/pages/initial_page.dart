// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tmdbmovies/app/routes/app_routes.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SplashScreen(
            seconds: 5,
            // ignore: prefer_const_constructors
            gradientBackground: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.5, 1),
                // ignore: prefer_const_literals_to_create_immutables
                colors: <Color>[
                  Color(0xff60368A),
                  Color(0xff000000),
                  Color(0xff000000),
                ],
                tileMode: TileMode.mirror),
            navigateAfterSeconds: Routes.LOGIN,
            loaderColor: Colors.transparent,
          ),
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/logo.png',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
