// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app_route/model/constants/constants.dart';
import 'package:movies_app_route/model/dataModel/movie/movie.dart';

class MoviesByGenreItem extends StatelessWidget {
  Movie movie;
  MoviesByGenreItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double hiegt = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              child: Image.network(
                width: width * 0.4,
                height: hiegt * 0.5,
                "${Constants.imgUrl}${movie.posterPath}",
                fit: BoxFit.cover,
              )),
          Container(
            height: hiegt * 0.13,
            decoration: const BoxDecoration(
                color: Color(0xa6131212),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )),
            child: Center(
              child: Text(
                movie.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          )
        ],
      ),
    );
  }
}
