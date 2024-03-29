import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_route/model/api/apiManager.dart';
import 'package:movies_app_route/model/dataModel/movie/movie.dart';
import 'package:movies_app_route/model/dataModel/movie/movieDetails.dart';
import 'package:movies_app_route/presentation/home/view/movieDetailsScreen/movieDetailsCubit/movieDetailsStates.dart';

class MovieDetailsViewModel extends Cubit<MovieDetailsStates> {
  MovieDetailsViewModel() : super(MovieDetailsLoading());

  void getMovieDetails(String movieID) async {
    try {
      emit(MovieDetailsLoading());
      MovieDetails? movie = await ApiManager.getMovieDetails(movieID);

      emit(MovieDetailsSuccess(movie: movie));
    } catch (e) {
      print(e.toString());
      print("error");
      emit(MovieDetailsFailure(errorMessege: e.toString()));
    }
  }

  void getMovieSimilar(String movieID) async {
    try {
      emit(SimilarMovieLoading());
      List<Movie> moviesList = await ApiManager.getSimilar(movieID);
      emit(SimilarMovieSuccess(moviesList: moviesList));
    } catch (e) {
      emit(SimilarMovieFailure(errorMessege: e.toString()));
    }
  }
}
