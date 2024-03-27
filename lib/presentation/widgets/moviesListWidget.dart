import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_route/presentation/home/viewModel/cubit/homeStates.dart';
import 'package:movies_app_route/presentation/home/viewModel/cubit/homeViewModel.dart';
import 'package:movies_app_route/presentation/widgets/posterItem.dart';
import 'package:movies_app_route/theme/appTheme.dart';

class MoviesListWidget extends StatefulWidget {
  const MoviesListWidget({super.key});

  @override
  State<MoviesListWidget> createState() => _MoviesListWidgetState();
}

class _MoviesListWidgetState extends State<MoviesListWidget> {
  @override
  void initState() {
    super.initState();

    homeViewModel.getUpcomingMovies();
  }

  HomeViewModel homeViewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        height:
            screenHeight < 2000.0 ? screenHeight * 0.45 : screenHeight * 0.4,
        width: screenWidth,
        decoration: BoxDecoration(
          color: MyTheme.greyColor,
        ),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16, bottom: 16, top: 8),
                child: Text(
                  "Recommended",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 8),
                    child: BlocBuilder<HomeViewModel, HomeStates>(
                      bloc: homeViewModel,
                      builder: (context, state) {
                        if (state is UpcomingMovieLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is UpcomingMovieSuccess) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            color: Colors.black,
                            elevation: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PosterItem(
                                  height: screenHeight * 0.2,
                                  width: screenWidth * 0.3,
                                  movie: state.moviesList[index],
                                ),
                                const SizedBox(
                                  height: 5,
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
                                      state.moviesList[index].voteAverage
                                          .roundToDouble()
                                          .toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ],
                                ),
                                Text(
                                  state.moviesList[index].originalTitle,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 8),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      state.moviesList[index].releaseDate.year
                                          .toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        } else if (state is UpcomingMovieSuccess) {
                          return const Center(child: Text("Error"));
                        }
                        return Container();
                      },
                    ),
                  ),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ));
  }
}
