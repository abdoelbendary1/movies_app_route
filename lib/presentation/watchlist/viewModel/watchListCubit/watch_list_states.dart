// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movies_app_route/model/dataModel/movie/movie.dart';

class WatchListStates {}

class WatchListLoadig extends WatchListStates {}

class WatchListSuccess extends WatchListStates {
  List<Movie> moviesList;
  WatchListSuccess({
    required this.moviesList,
  });
}

class WatchListFailure extends WatchListStates {}
