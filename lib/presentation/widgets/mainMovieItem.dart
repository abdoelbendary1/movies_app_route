import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app_route/model/constants/constants.dart';
import 'package:movies_app_route/presentation/widgets/posterItem.dart';

class MainMovieItem extends StatelessWidget {
  const MainMovieItem({super.key});

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
                height: screenHeight * 0.23,
                width: screenWidth,
                child: Image.asset(
                  "${Constants.imgPath}poster.jpg",
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
              PosterItem(height: screenHeight * 0.25, width: screenWidth * 0.3),
              const SizedBox(
                width: 20,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Movie discription",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Movie details",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
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
