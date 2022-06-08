import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:tmdbmovies/app/routes/app_routes.dart';

import 'package:tmdbmovies/app/ui/themes/app_color.dart';

class MovieAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(
          onTap: () {
            Get.toNamed(Routes.HOME);
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColors.shape,
            size: 30,
          ))
    ]);
  }
}
