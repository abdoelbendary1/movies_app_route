// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_route/model/constants/constants.dart';
import 'package:movies_app_route/model/dataModel/movie/movie.dart';
import 'package:movies_app_route/presentation/watchlist/viewModel/watchListCubit/watch_list_states.dart';
import 'package:movies_app_route/presentation/watchlist/viewModel/watchListCubit/watchlistViewModel.dart';

class PosterItem extends StatefulWidget {
  double height;
  double width;
  Movie movie;

  PosterItem({
    required this.height,
    required this.width,
    required this.movie,
  });

  @override
  State<PosterItem> createState() => _PosterItemState();
}

class _PosterItemState extends State<PosterItem> {
  WatchListViewModel watchListViewModel = WatchListViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    watchListViewModel.getAllBookmarkedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListViewModel, WatchListStates>(
        bloc: watchListViewModel,
        builder: (context, state) {
          if (state is WatchListLoadig) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WatchListSuccess) {
            return Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SizedBox(
                    height: widget.height,
                    width: widget.width,
                    child: Image.network(
                      "${Constants.imgUrl}${widget.movie.posterPath}",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (widget.movie.isWatchList = false) {
                      widget.movie.isWatchList = true;
                      watchListViewModel.addToWatchList(widget.movie);
                      watchListViewModel.getAllBookmarkedMovies();
                    }
                    widget.movie.isWatchList = false;
                  },
                  child: widget.movie.isWatchList
                      ? Image.asset(
                          "${Constants.iconPath}bookmarked.png",
                        )
                      : Image.asset(
                          "${Constants.iconPath}bookmark.png",
                        ),
                ),
              ],
            );
          } else if (state is WatchListFailure) {
            return const Text("data");
          }
          return Container();
        });
  }
}
