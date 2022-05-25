import 'package:get/route_manager.dart';
import 'package:tmdbmovies/app/routes/app_routes.dart';
import 'package:tmdbmovies/app/ui/pages/home_page.dart';
import 'package:tmdbmovies/app/ui/pages/initial_page.dart';
import 'package:tmdbmovies/app/ui/pages/login_page.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => InitialPage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
  ];
}
