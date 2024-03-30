// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movies_app_route/model/constants/constants.dart';

import 'package:movies_app_route/model/dataModel/movie/movie.dart';
import 'package:movies_app_route/model/dataModel/movie/movieDetails.dart';
import 'package:movies_app_route/theme/appTheme.dart';

class WatchListItem extends StatelessWidget {
  Movie movie;
  WatchListItem({
    Key? key,
    required this.movie,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Image.network(
          "${Constants.imgUrl}${movie.backdropPath}",
          fit: BoxFit.cover,
          width: 100,
        ),
        title: Text(movie.title,
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(movie.releaseDate.toString(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 14, color: Colors.grey)),
            Text(movie.title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 14, color: Colors.grey)),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: MyTheme.yellowColor,
                ),
                Text(movie.voteAverage.roundToDouble().toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 16))
              ],
            )
          ],
        ),
      ),
    );
  }
}
