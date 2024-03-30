import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_route/presentation/browse/view/browesItem.dart';
import 'package:movies_app_route/presentation/browse/view/moviesByGenreScreen.dart';
import 'package:movies_app_route/presentation/browse/viewModel/browseCubit/genreStates.dart';
import 'package:movies_app_route/presentation/browse/viewModel/browseCubit/genreViewModel.dart';
import 'package:movies_app_route/theme/appTheme.dart';

class BrowseView extends StatefulWidget {
  BrowseView({super.key});

  @override
  State<BrowseView> createState() => _BrowseViewState();
}

class _BrowseViewState extends State<BrowseView> {
  GenreViewModel genreViewModel = GenreViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    genreViewModel.getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Watch List',
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
              child: BlocBuilder<GenreViewModel, GenreStates>(
            bloc: genreViewModel,
            builder: (context, state) {
              if (state is GenreLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GenreFailure) {
                return const Text(
                  "error",
                  style: TextStyle(color: Colors.amber),
                );
              } else if (state is GenreSuccess) {
                return GridView.builder(
                  itemCount: state.genres.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, MoviesByGenreScreen.routeName,
                            arguments: state.genres[index]);
                      },
                      child: BrowesItem(
                        genre: state.genres[index],
                      ),
                    );
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
