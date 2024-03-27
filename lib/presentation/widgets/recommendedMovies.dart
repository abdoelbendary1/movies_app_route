import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_route/presentation/widgets/posterItem.dart';
import 'package:movies_app_route/theme/appTheme.dart';

class RecommendedMoviesList extends StatelessWidget {
  const RecommendedMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        height: screenHeight * 0.3,
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
                    child: PosterItem(
                        height: screenHeight * 0.2, width: screenWidth * 0.25),
                  ),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ));
  }
}
