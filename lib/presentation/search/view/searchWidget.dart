// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:movies_app_route/model/api/apiManager.dart';
import 'package:movies_app_route/model/dataModel/model.dart';
import 'package:movies_app_route/model/dataModel/movie/movie.dart';
import 'package:movies_app_route/presentation/watchlist/view/WatchListItem.dart';
import 'package:movies_app_route/theme/appTheme.dart';

class SearchWidget extends SearchDelegate {
  /* List<Movie> moviesList;
  SearchWidget({
    required this.moviesList,
  }); */

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getsearchedMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              return ListView.builder(
                  itemCount: snapshot.data?.length ?? [].length,
                  itemBuilder: (context, index) => WatchListItem(
                      movie: snapshot.data?[index] ??
                          Movie(
                              adult: false,
                              backdropPath: "/1XDDXPXGiI8id7MrUxK36ke7gkX.jpg",
                              genreIds: [28, 12, 16, 35, 10751],
                              id: 1011985,
                              originalLanguage: OriginalLanguage.EN,
                              originalTitle: "Kung Fu Panda 4",
                              overview:
                                  "Po is gearing up to become the spiritual leader of his Valley of Peace, but also needs someone to take his place as Dragon Warrior. As such, he will train a new kung fu practitioner for the spot and will encounter a villain called the Chameleon who conjures villains from the past.",
                              popularity: 4028.167,
                              posterPath: "/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg",
                              releaseDate: DateTime.now(),
                              title: "Kung Fu Panda 4",
                              video: false,
                              voteAverage: 6.938,
                              voteCount: 379)));
            } else {
              return const Text(
                "Error ",
                style: TextStyle(color: Colors.blue),
              );
            }
          } else if (snapshot.connectionState == ConnectionState.none) {
            return const Text(
              "error",
              style: TextStyle(color: Colors.amber),
            );
          } else {
            return const Text(
              "Error ",
              style: TextStyle(color: Colors.white),
            );
          }
        });
    /*  List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        }); */
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getPopularMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              return ListView.builder(
                  itemCount: snapshot.data?.length ?? [].length,
                  itemBuilder: (context, index) => WatchListItem(
                      movie: snapshot.data?[index] ??
                          Movie(
                              adult: false,
                              backdropPath: "/1XDDXPXGiI8id7MrUxK36ke7gkX.jpg",
                              genreIds: [28, 12, 16, 35, 10751],
                              id: 1011985,
                              originalLanguage: OriginalLanguage.EN,
                              originalTitle: "Kung Fu Panda 4",
                              overview:
                                  "Po is gearing up to become the spiritual leader of his Valley of Peace, but also needs someone to take his place as Dragon Warrior. As such, he will train a new kung fu practitioner for the spot and will encounter a villain called the Chameleon who conjures villains from the past.",
                              popularity: 4028.167,
                              posterPath: "/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg",
                              releaseDate: DateTime.now(),
                              title: "Kung Fu Panda 4",
                              video: false,
                              voteAverage: 6.938,
                              voteCount: 379)));
            } else {
              return const Text(
                "Error ",
                style: TextStyle(color: Colors.blue),
              );
            }
          } else if (snapshot.connectionState == ConnectionState.none) {
            return const Text(
              "error",
              style: TextStyle(color: Colors.amber),
            );
          } else {
            return const Text(
              "Error ",
              style: TextStyle(color: Colors.white),
            );
          }
        });
  }
}
