// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movies_app_route/model/dataModel/movie/movie.dart';

class HomeStates {}

class MainMovieLoading extends HomeStates {}

class MainMovieSuccess extends HomeStates {
  List<Movie> moviesList;
  MainMovieSuccess({
    required this.moviesList,
  });
}

class MainMovieFailure extends HomeStates {
  String errorMessege;
  MainMovieFailure({
    required this.errorMessege,
  });
}

class UpcomingMovieLoading extends HomeStates {}

class UpcomingMovieSuccess extends HomeStates {
  List<Movie> moviesList;
  UpcomingMovieSuccess({
    required this.moviesList,
  });
}

class UpcomingMovieFailure extends HomeStates {
  String errorMessege;
  UpcomingMovieFailure({
    required this.errorMessege,
  });
}

class TopRatedMovieLoading extends HomeStates {}

class TopRatedMovieSuccess extends HomeStates {
  List<Movie> moviesList;
  TopRatedMovieSuccess({
    required this.moviesList,
  });
}

class TopRatedMovieFailure extends HomeStates {
  String errorMessege;
  TopRatedMovieFailure({
    required this.errorMessege,
  });
}
