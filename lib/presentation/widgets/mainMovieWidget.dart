import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_route/model/dataModel/movie/movie.dart';
import 'package:movies_app_route/presentation/home/viewModel/cubit/homeStates.dart';
import 'package:movies_app_route/presentation/home/viewModel/cubit/homeViewModel.dart';
import 'package:movies_app_route/presentation/widgets/mainMovieItem.dart';

class MainMovieSlider extends StatefulWidget {
  MainMovieSlider();

  @override
  State<MainMovieSlider> createState() => _MainMovieSliderState();
}

class _MainMovieSliderState extends State<MainMovieSlider> {
  HomeViewModel homeViewModel = HomeViewModel();
  @override
  void initState() {
    super.initState();
    homeViewModel.getMainMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.33,
      child: BlocBuilder<HomeViewModel, HomeStates>(
        bloc: homeViewModel,
        builder: (context, state) {
          if (state is MainMovieLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MainMovieSuccess) {
            print(state.moviesList);
            return CarouselSlider.builder(
                itemCount: state.moviesList.length,
                itemBuilder: (context, itemIndex, pageViewIndex) =>
                    GestureDetector(
                      onTap: () {},
                      child: MainMovieItem(
                        movie: state.moviesList[itemIndex],
                      ),
                    ),
                options: CarouselOptions(
                  autoPlay: false,
                  autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  autoPlayAnimationDuration: Duration(seconds: 2),
                ));
          } else if (state is MainMovieFailure) {
            return const Center(child: Text("Error"));
          }

          return Container();
        },
      ),
    );
  }
}
