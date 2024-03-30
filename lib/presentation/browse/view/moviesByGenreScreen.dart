// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_route/model/dataModel/movie/genre/genre.dart';
import 'package:movies_app_route/presentation/browse/view/browesItem.dart';
import 'package:movies_app_route/presentation/browse/view/moviesByGenre.dart';
import 'package:movies_app_route/presentation/browse/viewModel/browseCubit/genreStates.dart';
import 'package:movies_app_route/presentation/browse/viewModel/browseCubit/genreViewModel.dart';
import 'package:movies_app_route/presentation/browse/viewModel/moviesByGenreCubit/moviesByGenreStates.dart';
import 'package:movies_app_route/presentation/browse/viewModel/moviesByGenreCubit/moviesByGenreViewModel.dart';
import 'package:movies_app_route/theme/appTheme.dart';

class MoviesByGenreScreen extends StatefulWidget {
  static const String routeName = "movieByGenre";

  @override
  State<MoviesByGenreScreen> createState() => _MoviesByGenreScreenState();
}

class _MoviesByGenreScreenState extends State<MoviesByGenreScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var genre = ModalRoute.of(context)!.settings.arguments as Genres;
    MoviesByGenreViewModel moviesByGenreViewModel =
        MoviesByGenreViewModel(genre: genre);
    moviesByGenreViewModel.getMoviesByGenres();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              genre.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Divider(
            color: MyTheme.yellowColor,
            thickness: 1,
            indent: 15,
            endIndent: 15,
          ),
          Expanded(
              child: BlocBuilder<MoviesByGenreViewModel, MoviesByGenreStates>(
            bloc: moviesByGenreViewModel,
            builder: (context, state) {
              if (state is MoviesByGenreLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MoviesByGenreFailure) {
                return const Text(
                  "error",
                  style: TextStyle(color: Colors.amber),
                );
              } else if (state is MoviesByGenreSuccess) {
                return GridView.builder(
                  itemCount: state.moviesList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {},
                        child:
                            MoviesByGenreItem(movie: state.moviesList[index]));
                  },
                );
              }
              return Container();
            },
          )),
        ],
      ),
    );
  }
}
