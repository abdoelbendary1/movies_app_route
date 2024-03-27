// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:movies_app_route/model/constants/constants.dart';
import 'package:movies_app_route/model/dataModel/movie/movie.dart';

class PosterItem extends StatelessWidget {
  double height;
  double width;
  Movie movie;
  PosterItem({
    required this.height,
    required this.width,
    required this.movie,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: SizedBox(
            height: height,
            width: width,
            child: Image.network(
              "${Constants.imgUrl}${movie.posterPath}",
              fit: BoxFit.fill,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Image.asset(
            "${Constants.iconPath}bookmark.png",
          ),
        ),
      ],
    );
  }
}
