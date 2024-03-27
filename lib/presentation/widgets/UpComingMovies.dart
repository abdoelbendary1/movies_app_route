// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_route/model/dataModel/movie/movie.dart';
import 'package:movies_app_route/presentation/home/viewModel/cubit/homeStates.dart';
import 'package:movies_app_route/presentation/home/viewModel/cubit/homeViewModel.dart';
import 'package:movies_app_route/presentation/widgets/posterItem.dart';
import 'package:movies_app_route/theme/appTheme.dart';

class UpComingMovies extends StatefulWidget {
  UpComingMovies({
    Key? key,
  }) : super(key: key);

  @override
  State<UpComingMovies> createState() => _UpComingMoviesState();
}

class _UpComingMoviesState extends State<UpComingMovies> {
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
      height: screenHeight * 0.33,
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
                "New Releases",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: BlocBuilder<HomeViewModel, HomeStates>(
                    bloc: homeViewModel,
                    builder: (context, state) {
                      if (state is UpcomingMovieLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is UpcomingMovieSuccess) {
                        return PosterItem(
                          height: screenHeight * 0.2,
                          width: screenWidth * 0.25,
                          movie: state.moviesList[index],
                        );
                      } else if (state is UpcomingMovieSuccess) {
                        return const Center(
                            child: Text(
                          "Error",
                          style: TextStyle(color: Colors.amber),
                        ));
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
      ),
    );
  }
}
