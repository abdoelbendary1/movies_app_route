import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app_route/model/constants/constants.dart';
import 'package:movies_app_route/model/dataModel/movie/movie.dart';
import 'package:movies_app_route/presentation/widgets/posterItem.dart';
import 'package:movies_app_route/theme/appTheme.dart';

class MainMovieItem extends StatelessWidget {
  MainMovieItem({required this.movie});
  Movie movie;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                height: screenHeight * 0.18,
                width: screenWidth,
                child: Image.network(
                  "${Constants.imgUrl}${movie.backdropPath}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              height: screenHeight * 0.25,
              width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "${Constants.iconPath}playButton.png",
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          left: 10,
          bottom: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              PosterItem(
                height: screenHeight * 0.2,
                width: screenWidth * 0.3,
                movie: movie,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.originalTitle,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: MyTheme.yellowColor,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        movie.voteAverage.roundToDouble().toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
