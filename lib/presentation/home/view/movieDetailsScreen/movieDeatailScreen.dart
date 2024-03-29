import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_route/model/constants/constants.dart';
import 'package:movies_app_route/model/dataModel/model.dart';
import 'package:movies_app_route/model/dataModel/movie/movie.dart';
import 'package:movies_app_route/presentation/home/view/movieDetailsScreen/movieDetailsCubit/movieDetailsStates.dart';
import 'package:movies_app_route/presentation/home/view/movieDetailsScreen/movieDetailsCubit/movieDetailsViewModel.dart';
import 'package:movies_app_route/presentation/widgets/UpComingMovies.dart';
import 'package:movies_app_route/presentation/widgets/mainMovieItem.dart';
import 'package:movies_app_route/presentation/widgets/moviesListWidget.dart';
import 'package:movies_app_route/presentation/widgets/posterItem.dart';
import 'package:movies_app_route/theme/appTheme.dart';

class MovieDeatailScreen extends StatefulWidget {
  MovieDeatailScreen({super.key});
  static const String routeName = "movieDeatailsScreen";

  @override
  State<MovieDeatailScreen> createState() => _MovieDeatailScreenState();
}

class _MovieDeatailScreenState extends State<MovieDeatailScreen> {
  MovieDetailsViewModel movieDetailsViewModel = MovieDetailsViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieDetailsViewModel.getMovieDetails("1011985");
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    var movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            movie.title,
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<MovieDetailsViewModel, MovieDetailsStates>(
          bloc: movieDetailsViewModel,
          builder: (context, state) {
            if (state is MovieDetailsSuccess) {
              print(movie.id);
              print(state.movie.originalTitle);
              return SingleChildScrollView(
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
                                "${Constants.imgUrl}${state.movie.backdropPath}",
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
                            state.movie.originalTitle,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /* PosterItem(
                              height: screenHeight * 0.25,
                              width: screenWidth * 0.4,
                              movie: state.movie), */
                          Column(
                            children: [
                              SingleChildScrollView(
                                child: SizedBox(
                                  width: screenWidth * 0.4,
                                  height: screenHeight * 0.22,
                                  child: Text(
                                    style: const TextStyle(color: Colors.white),
                                    state.movie.overview,
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
                                        state.movie.voteAverage
                                            .roundToDouble()
                                            .toString(),
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
                      const SizedBox(
                        height: 10,
                      ),
                      const MoviesListWidget()
                    ],
                  ),
                ),
              );
            } else if (state is MovieDetailsFailure) {
              print("fail");
              return Center(
                child: Text(
                  state.errorMessege,
                  style: const TextStyle(color: Colors.white, fontSize: 50),
                ),
              );
            } else if (state is MovieDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Container();
            }
          },
          listener: (context, state) {},
        ));
  }
}
