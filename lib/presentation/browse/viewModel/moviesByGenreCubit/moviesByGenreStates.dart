// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:movies_app_route/model/dataModel/movie/movie.dart';

class MoviesByGenreStates {}

class MoviesByGenreLoading extends MoviesByGenreStates {}

class MoviesByGenreSuccess extends MoviesByGenreStates {
  List<Movie> moviesList;
  MoviesByGenreSuccess({
    required this.moviesList,
  });
}

class MoviesByGenreFailure extends MoviesByGenreStates {}
