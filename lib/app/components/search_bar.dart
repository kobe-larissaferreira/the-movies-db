import 'package:flutter/material.dart';
import 'package:tmdbmovies/app/ui/themes/app_color.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 155, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            autofocus: false,
            style: TextStyle(color: AppColors.shape),
            decoration: InputDecoration(
                hintText: "Buscar ",
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
                )),
          ),
        ],
      ),
    );
  }
}
