// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movies_app_route/model/dataModel/movie/movie.dart';
import 'package:movies_app_route/model/dataModel/movie/movieDetails.dart';

class MovieDetailsStates {}

class MovieDetailsLoading extends MovieDetailsStates {}

class MovieDetailsSuccess extends MovieDetailsStates {
  MovieDetails movie;
  MovieDetailsSuccess({
    required this.movie,
  });
}

class MovieDetailsFailure extends MovieDetailsStates {
  String errorMessege;
  MovieDetailsFailure({
    required this.errorMessege,
  });
}
