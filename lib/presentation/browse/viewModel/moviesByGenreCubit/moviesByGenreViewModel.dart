import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_route/model/api/apiManager.dart';
import 'package:movies_app_route/model/dataModel/movie/genre/genre.dart';

import 'package:movies_app_route/presentation/browse/viewModel/moviesByGenreCubit/moviesByGenreStates.dart';

class MoviesByGenreViewModel extends Cubit<MoviesByGenreStates> {
  MoviesByGenreViewModel({required this.genre}) : super(MoviesByGenreLoading());
  Genres genre;

  void getMoviesByGenres() async {
    try {
      emit(MoviesByGenreLoading());
      var MoviesByGenres =
          await ApiManager.getMoviesByGenre(genreId: genre.id.toString());
      emit(MoviesByGenreSuccess(moviesList: MoviesByGenres));
    } catch (e) {
      emit(MoviesByGenreFailure());
    }
  }
}
