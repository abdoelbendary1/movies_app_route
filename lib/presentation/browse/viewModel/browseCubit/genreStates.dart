// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movies_app_route/model/dataModel/movie/genre/genre.dart';

class GenreStates {}

class GenreLoading extends GenreStates {}

class GenreSuccess extends GenreStates {
  List<Genres> genres;
  GenreSuccess({
    required this.genres,
  });
}

class GenreFailure extends GenreStates {}
