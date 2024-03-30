import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_route/model/constants/constants.dart';
import 'package:movies_app_route/model/dataModel/model.dart';
import 'package:movies_app_route/model/dataModel/movie/movie.dart';
import 'package:movies_app_route/presentation/home/view/movieDetailsScreen/movieDetailsCubit/movieDetailsStates.dart';
import 'package:movies_app_route/presentation/home/view/movieDetailsScreen/movieDetailsCubit/movieDetailsViewModel.dart';
import 'package:movies_app_route/presentation/home/viewModel/cubit/homeViewModel.dart';
import 'package:movies_app_route/presentation/widgets/UpComingMovies.dart';
import 'package:movies_app_route/presentation/widgets/mainMovieItem.dart';
import 'package:movies_app_route/presentation/widgets/moviesListWidget.dart';
import 'package:movies_app_route/presentation/widgets/posterItem.dart';
import 'package:movies_app_route/presentation/widgets/similarMoviesList.dart';
import 'package:movies_app_route/theme/appTheme.dart';

class MovieDeatailScreen extends StatefulWidget {
  MovieDeatailScreen({super.key});
  static const String routeName = "movieDeatailsScreen";

  @override
  State<MovieDeatailScreen> createState() => _MovieDeatailScreenState();
}

class _MovieDeatailScreenState extends State<MovieDeatailScreen> {
  MovieDetailsViewModel movieDetailsViewModel = MovieDetailsViewModel();
  HomeViewModel homeViewModel = HomeViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    var movie = ModalRoute.of(context)!.settings.arguments as Movie;
    movieDetailsViewModel.getMovieDetails(movie.id.toString());

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
              print(state.movie.title);
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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Text(
                              state.movie.title,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 25),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PosterItem(
                                  height: screenHeight * 0.30,
                                  width: screenWidth * 0.4,
                                  movie: movie),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: screenWidth * 0.5,
                                      height: screenHeight * 0.2,
                                      child: Text(
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 13),
                                        state.movie.overView,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: MyTheme.yellowColor,
                                          size: 40,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          state.movie.voteAverage
                                              .roundToDouble()
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 30),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              height: screenHeight * 0.7,
                              child: SimilarMoviesListWidget(
                                movieId: movie.id.toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
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
