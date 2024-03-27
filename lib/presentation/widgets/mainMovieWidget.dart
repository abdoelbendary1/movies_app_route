import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_route/presentation/widgets/mainMovieItem.dart';

class MainMovieSlider extends StatelessWidget {
  const MainMovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.33,
      child: CarouselSlider.builder(
          itemCount: 10,
          itemBuilder: (context, itemIndex, pageViewIndex) => GestureDetector(
                onTap: () {},
                child: MainMovieItem(),
              ),
          options: CarouselOptions(
            autoPlay: false,
            autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
            enlargeCenterPage: true,
            viewportFraction: 1,
            autoPlayAnimationDuration: Duration(seconds: 2),
          )),
    );
  }
}
