import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_route/model/api/apiManager.dart';
import 'package:movies_app_route/model/dataModel/movie/movie.dart';
import 'package:movies_app_route/presentation/home/viewModel/cubit/homeStates.dart';

class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel() : super(MainMovieLoading());

  void getMainMovies() async {
    try {
      emit(MainMovieLoading());
      List<Movie> moviesList = await ApiManager.getPopularMovies();
      emit(MainMovieSuccess(moviesList: moviesList));
    } catch (e) {
      emit(MainMovieFailure(errorMessege: e.toString()));
    }
  }

  void getUpcomingMovies() async {
    try {
      emit(UpcomingMovieLoading());
      List<Movie> moviesList = await ApiManager.getUpcomingMovies();
      emit(UpcomingMovieSuccess(moviesList: moviesList));
    } catch (e) {
      emit(UpcomingMovieFailure(errorMessege: e.toString()));
    }
  }

  void getTopRatedMovies() async {
    try {
      emit(UpcomingMovieLoading());
      List<Movie> moviesList = await ApiManager.getTopRated();
      emit(UpcomingMovieSuccess(moviesList: moviesList));
    } catch (e) {
      emit(UpcomingMovieFailure(errorMessege: e.toString()));
    }
  }
}
