import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_route/presentation/search/viewModel/searchCubit/searchStates.dart';

class SearchViewModel extends Cubit<SearchStates> {
  SearchViewModel() : super(SearchLoading());
}
