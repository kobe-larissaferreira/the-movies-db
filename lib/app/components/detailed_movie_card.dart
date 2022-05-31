import 'package:flutter/material.dart';
import '/app/data/model/movie.dart';
import 'package:tmdbmovies/app/ui/themes/app_color.dart';

class DetailedMovieCard extends StatelessWidget {
  const DetailedMovieCard({this.detailedMovie, Key key}) : super(key: key);

  String simplyFormat({@required DateTime time}) {
    String year = time.year.toString();
    String month = time.month.toString().padLeft(2, '0');
    String day = time.day.toString().padLeft(2, '0');

    return "$day-$month-$year";
  }

  final Movie detailedMovie;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColorDark,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //TODO -> imagem
          Padding(
            padding:
                const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${detailedMovie.title}",
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 18.5,
                  ),
                ),
                Text(
                  "${detailedMovie.runtime} min " +
                      "   " +
                      "Lançamento: " +
                      simplyFormat(time: detailedMovie.releaseDate) +
                      "   " +
                      "Avaliação: ${detailedMovie.popularity}%",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.5,
                  ),
                ),
                SizedBox(height: 15),
                Text("${detailedMovie.textOverview}",
                    style: TextStyle(
                      fontSize: 14.5,
                      color: AppColors.white,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
