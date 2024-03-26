import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_route/presentation/widgets/mainMovieWidget.dart';
import 'package:movies_app_route/presentation/widgets/moviesListWidget.dart';
import 'package:movies_app_route/presentation/widgets/recommendedMovies.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: const SingleChildScrollView(
          child: Column(
            children: [
              MainMovieSlider(),
              SizedBox(
                height: 20,
              ),
              RecommendedMoviesList(),
              SizedBox(
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
