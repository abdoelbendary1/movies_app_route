import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app_route/model/constants/constants.dart';
import 'package:movies_app_route/model/dataModel/model.dart';
import 'package:movies_app_route/model/dataModel/movie/movie.dart';
import 'package:movies_app_route/presentation/widgets/UpComingMovies.dart';
import 'package:movies_app_route/presentation/widgets/mainMovieItem.dart';
import 'package:movies_app_route/presentation/widgets/moviesListWidget.dart';
import 'package:movies_app_route/presentation/widgets/posterItem.dart';
import 'package:movies_app_route/theme/appTheme.dart';

class MovieDeatailScreen extends StatelessWidget {
  MovieDeatailScreen({super.key});
  static const String routeName = "movieDeatailsScreen";

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    var movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            movie.title,
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        height: screenHeight * 0.25,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      movie.originalTitle,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PosterItem(
                        height: screenHeight * 0.25,
                        width: screenWidth * 0.4,
                        movie: movie),
                    Column(
                      children: [
                        SingleChildScrollView(
                          child: SizedBox(
                            width: screenWidth * 0.4,
                            height: screenHeight * 0.22,
                            child: Text(
                              style: TextStyle(color: Colors.white),
                              movie.overview,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                MoviesListWidget()
              ],
            ),
          ),
        ));
  }
}
