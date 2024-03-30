import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_route/model/api/apiManager.dart';
import 'package:movies_app_route/presentation/browse/viewModel/browseCubit/genreStates.dart';

class GenreViewModel extends Cubit<GenreStates> {
  GenreViewModel() : super(GenreLoading());

  void getGenres() async {
    try {
      emit(GenreLoading());
      var genres = await ApiManager.getGenres();
      emit(GenreSuccess(genres: genres));
    } catch (e) {
      emit(GenreFailure());
    }
  }
}
