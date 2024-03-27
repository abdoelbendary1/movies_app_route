import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_route/model/api/apiManager.dart';
import 'package:movies_app_route/model/dataModel/movie/movie.dart';
import 'package:movies_app_route/presentation/home/viewModel/cubit/homeStates.dart';
import 'package:movies_app_route/presentation/home/viewModel/cubit/homeViewModel.dart';
import 'package:movies_app_route/presentation/widgets/mainMovieWidget.dart';
import 'package:movies_app_route/presentation/widgets/moviesListWidget.dart';
import 'package:movies_app_route/presentation/widgets/UpComingMovies.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainMovieSlider(),
              const SizedBox(
                height: 20,
              ),
              UpComingMovies(),
              const SizedBox(
                height: 20,
              ),
              MoviesListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
