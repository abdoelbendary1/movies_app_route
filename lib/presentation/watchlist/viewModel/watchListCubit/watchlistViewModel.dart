import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_route/model/dataModel/movie/movie.dart';
import 'package:movies_app_route/presentation/watchlist/viewModel/watchListCubit/watch_list_states.dart';

class WatchListViewModel extends Cubit<WatchListStates> {
  WatchListViewModel() : super(WatchListLoadig());
  List<Movie> bookmarkedMovies = [];

  void addToWatchList(Movie movie) {
    movie.isWatchList = true;
    bookmarkedMovies.add(movie);
  }

  void getAllBookmarkedMovies() {
    try {
      emit(WatchListLoadig());
      emit(WatchListSuccess(moviesList: bookmarkedMovies));
    } catch (e) {
      emit(WatchListFailure());
    }

    ;
  }
}
