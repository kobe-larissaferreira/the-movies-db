import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tmdbmovies/app/bindings/login_binding.dart';
import 'package:tmdbmovies/app/routes/app_routes.dart';
import 'package:tmdbmovies/app/ui/pages/details_page.dart';
import 'package:tmdbmovies/app/ui/pages/home_page.dart';
import 'package:tmdbmovies/app/ui/pages/initial_page.dart';
import 'package:tmdbmovies/app/ui/pages/login_page.dart';
import 'package:tmdbmovies/app/ui/pages/register_page.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => InitialPage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.DETAILS,
      page: () => DetailPage(),
    ),
  ];
}
