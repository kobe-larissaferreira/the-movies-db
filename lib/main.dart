import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tmdbmovies/app/routes/app_pages.dart';
import 'package:tmdbmovies/app/ui/themes/app_theme.dart';

import 'app/routes/app_routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Tmdb Movies',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: Routes.INITIAL,
      theme: appThemeData,
    ),
  );
}
