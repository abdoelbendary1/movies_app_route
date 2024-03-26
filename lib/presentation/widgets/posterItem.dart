// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:movies_app_route/model/constants/constants.dart';

class PosterItem extends StatelessWidget {
  double height;
  double width;
  PosterItem({
    required this.height,
    required this.width,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: SizedBox(
            height: height,
            width: width,
            child: Image.asset(
              "assets/images/poster.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Image.asset(
            "${Constants.iconPath}bookmark.png",
          ),
        ),
      ],
    );
  }
}
