import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_route/presentation/watchlist/view/WatchListItem.dart';
import 'package:movies_app_route/presentation/watchlist/viewModel/watchListCubit/watch_list_states.dart';
import 'package:movies_app_route/presentation/watchlist/viewModel/watchListCubit/watchlistViewModel.dart';

import '../../../theme/appTheme.dart';

class WatchListView extends StatefulWidget {
  WatchListView({super.key});

  @override
  State<WatchListView> createState() => _WatchListViewState();
}

class _WatchListViewState extends State<WatchListView> {
  WatchListViewModel watchListViewModel = WatchListViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    watchListViewModel.getAllBookmarkedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: MyTheme.yellowColor,
          size: 35,
        ),
        backgroundColor: MyTheme.blackColor,
        toolbarHeight: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Watch List",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
      body: Expanded(
          child: BlocBuilder<WatchListViewModel, WatchListStates>(
        bloc: watchListViewModel,
        builder: (context, state) {
          if (state is WatchListLoadig) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WatchListSuccess) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return WatchListItem(
                        movie: state.moviesList[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: MyTheme.yellowColor,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      );
                    },
                    itemCount: state.moviesList.length,
                  );
                } else if (state is WatchListFailure) {
                  return Text("Error Poster");
                }
                return Container();
              },
            )),
    );
  }
}
