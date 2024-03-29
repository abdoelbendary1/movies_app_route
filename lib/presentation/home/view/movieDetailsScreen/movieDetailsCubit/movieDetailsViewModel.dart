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
      MovieDetails? movie = await ApiManager.fetchMovieDetails(movieID);

      emit(MovieDetailsSuccess(
          movie: movie ??
              MovieDetails(
                adult: false,
                backdropPath: "/1XDDXPXGiI8id7MrUxK36ke7gkX.jpg",
                homepage: "homepage",
                id: 15515,
                imdbId: "imdbId",
                originalLanguage: "",
                originalTitle: "originalTitle",
                overview: "overview",
                popularity: 1,
                posterPath: "/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg",
                releaseDate: DateTime.now(),
                revenue: 1,
                runtime: 1,
                status: "status",
                tagline: "tagline",
                title: "title",
                video: false,
                voteAverage: 2,
                voteCount: 2,
              )));
    } catch (e) {
      print(e.toString());
      print("error");
      emit(MovieDetailsFailure(errorMessege: e.toString()));
    }
  }
}
