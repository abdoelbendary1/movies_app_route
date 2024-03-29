import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_route/model/api/apiManager.dart';
import 'package:movies_app_route/model/dataModel/model.dart';
import 'package:movies_app_route/model/dataModel/movie/movie.dart';
import 'package:movies_app_route/presentation/home/viewModel/cubit/homeStates.dart';

class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel() : super(MainMovieLoading());

  void getMainMovies() async {
    try {
      emit(MainMovieLoading());

      List<Movie> moviesList = await ApiManager.getPopularMovies();
      if (moviesList.isNotEmpty) {
        emit(MainMovieSuccess(moviesList: moviesList));
      } else {
        print("else");
        moviesList = [
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
              voteCount: 379)
        ];
      }
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
